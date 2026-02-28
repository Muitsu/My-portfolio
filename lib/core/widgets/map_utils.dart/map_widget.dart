import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

part 'map_marker.dart';

class MapLatLng {
  double latitude, longitude;
  MapLatLng(this.latitude, this.longitude);
}

class MapWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final MapLatLng? latLng;
  final List<MapMarker> markers;
  final BorderRadiusGeometry? borderRadius;
  final bool liteMode;

  const MapWidget({
    super.key,
    this.latLng,
    this.height,
    this.width,
    this.borderRadius,
    this.markers = const [],
    this.liteMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadiusDirectional.circular(20),
      ),
      height: height ?? size.height * 0.45,
      width: width,
      child: FlutterMap(
        options: MapOptions(
          interactionOptions: InteractionOptions(
            flags: liteMode ? InteractiveFlag.all : InteractiveFlag.none,
          ),
          initialCenter: LatLng(
            latLng?.latitude ?? 3.1390,
            latLng?.longitude ?? 101.6869,
          ),
          initialZoom: 16,
        ),
        children: [
          openStreetMapTileLayer,
          TileLayer(
            urlTemplate: OpenStreetMapStyle.darkMatter.url,
            userAgentPackageName: 'com.example.app',
            subdomains: const ['a', 'b', 'c', 'd'],
            tileProvider: NetworkTileProvider(),
          ),
          MarkerLayer(
              markers: markers
                  .map((e) =>
                      _buildGlowingMarker(LatLng(e.latitude, e.longitude)))
                  .toList()),
        ],
      ),
    );
  }

  Marker _buildGlowingMarker(LatLng point) {
    return Marker(
      point: point,
      width: 40,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Glow
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.cyanAccent.withValues(alpha: 0.3),
              boxShadow: [
                BoxShadow(
                    color: Colors.cyanAccent.withValues(alpha: 0.5),
                    blurRadius: 15,
                    spreadRadius: 5),
              ],
            ),
          ),
          // Inner Solid Dot
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.cyanAccent),
          ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: OpenStreetMapStyle.gmap.url,
      userAgentPackageName: 'com.ils.bancian.ils_bancian',
      subdomains: const ['a', 'b', 'c'],
      tileProvider: NetworkTileProvider(),
    );

enum OpenStreetMapStyle {
  origin(url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"),
  basic(
    url:
        "https://api.maptiler.com/maps/basic-v2/{z}/{x}/{y}@2x.png?key=ivZxMtkmnnEJaFDGEcce",
  ),
  topo(
    url:
        "https://api.maptiler.com/maps/topo-v2/{z}/{x}/{y}@2x.png?key=ivZxMtkmnnEJaFDGEcce",
  ),
  cartiqo(
    url:
        "https://api.maptiler.com/maps/nl-cartiqo-topo/{z}/{x}/{y}@2x.png?key=ivZxMtkmnnEJaFDGEcce",
  ),
  darkMapBox(
    url:
        "https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}.png",
  ),
  rasterWhite(
    url:
        "https://{s}.basemaps.cartocdn.com/rastertiles/voyager_labels_under/{z}/{x}/{y}{r}.png",
  ),
  cartocdn(
    url: "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png",
  ),
  darkVoyager(
    url: "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png",
  ),
  gmap(url: "https://mt0.google.com/vt/lyrs=m@221097413&x={x}&y={y}&z={z}"),

  /// Ultra-clean light style (Great for data visualization)
  positron(
      url: "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png"),

  /// High-contrast Dark (Pure black/grey, very "Mapcn")
  darkMatter(
      url: "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png"),

  /// Google Maps Satellite Hybrid
  gmapSatellite(url: "https://mt0.google.com/vt/lyrs=y&x={x}&y={y}&z={z}"),

  /// Google Maps Terrain only
  gmapTerrain(url: "https://mt0.google.com/vt/lyrs=p&x={x}&y={y}&z={z}"),

  /// Midtones/Grey (Stadia Alidade Smooth)
  smooth(
      url: "https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}.png"),
  ;

  final String url;
  const OpenStreetMapStyle({required this.url});
}
