import Test2 from "./test2";
import Satelites from "./satelites";
import React, { useRef, useState, Suspense } from "react";
import { Canvas, useFrame, useThree, extend } from "@react-three/fiber";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";

extend({ OrbitControls });

const CameraControls = () => {
  // Get a reference to the Three.js Camera, and the canvas html element.
  // We need these to setup the OrbitControls component.
  // https://threejs.org/docs/#examples/en/controls/OrbitControls
  const {
    camera,
    gl: { domElement },
  } = useThree();
  // Ref to the controls, so that we can update them on every frame using useFrame
  const controls = useRef();
  useFrame((state) => controls.current.update());
  return <orbitControls ref={controls} args={[camera, domElement]} />;
};

const Test = () => (
  <Canvas colorManagement camera={{ position: [10, 5, 9], fov: 40, far: 10000 }} raycaster={{ params: { Points: { threshold: 0.2 } } }}>
    <ambientLight />
    <CameraControls />
    <Suspense fallback={null}>
      <Test2 />
      <Satelites />
    </Suspense>
  </Canvas>
);
export default Test;
