import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:synapse/clasroom/components/classroom_title.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({super.key});

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  late GoogleMapController _mapController;

  final Marker IFPIMarker = const Marker(
    markerId: MarkerId("ifpi"),
    position: LatLng(-5.088598052654762, -42.811272528836064),
  );

  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(-5.088598052654762,
        -42.811272528836064), // Coordenadas de São Paulo, Brasil
    zoom: 14, // Nível de zoom inicial
  );

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  children: [
                    Text(
                      "O campus Teresina Central do Instituto Federal do Piauí (IFPI) é uma das unidades mais representativas e tradicionais da instituição, localizado na capital do estado",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Com uma infraestrutura ampla e moderna, o campus oferece uma variedade de cursos em diferentes níveis de formação, incluindo ensino médio técnico integrado, cursos superiores, pós-graduações e formações continuadas.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const TopicTitle(name: "Localização"),
                SizedBox(
                  width: 350,
                  height: 300,
                  child: GoogleMap(
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: _onMapCreated,
                    myLocationEnabled: true,
                    compassEnabled: true,
                    markers: {IFPIMarker},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
