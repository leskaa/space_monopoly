import React, { useRef, useState } from 'react'
import { useFrame, useThree } from '@react-three/fiber'
import * as THREE from 'three/build/three.module';

const Sidebar = (props) => {
    // This reference will give us direct access to the mesh
    // const mesh = useRef()
    // const { gl } = useThree();

    // Maybe we could raycast from the sidebar's access to the mesh? Idk?

    ///R = 6371 (Radius of the earth in km)

    // Return view, these are regular threejs elements expressed in JSX
    return (
      <div>
        <h1>Sidebar</h1>
        
      </div>
    )
  }

export default Sidebar