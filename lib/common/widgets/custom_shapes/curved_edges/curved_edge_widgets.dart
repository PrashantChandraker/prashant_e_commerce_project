
import 'package:flutter/material.dart';
import 'package:prashant_e_commerce_project/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key, this.givenchild,
  });

final Widget? givenchild;
  @override
  Widget build(BuildContext context) {
    
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: givenchild
    );
  }
}