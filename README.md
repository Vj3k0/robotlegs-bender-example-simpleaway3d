# Robotlegs and Away3D example

Simple example project to present Robotlegs 2 "bender" and Away3D 4.0 integration.

## TODO

- comment example

## Overview

This example is demonstrating integration between [Away3D 4.0](https://github.com/away3d/away3d-core-fp11) and [Robotlegs 2](https://github.com/robotlegs/robotlegs-framework). It is using [robotlegs2-away3d-viewmap](https://github.com/Vj3k0/robotlegs2-away3d-viewmap) extension for connecting those 2 frameworks.

Example means to provide information on how to use context, views and mediators.

## Usage instructions

Example will create plane object and place it on sceen. Click on plane to change its color.

## How it works

First of, Away3D is setup (view and scene are created, render loop setup, resize handler in place). 

Then context is created, passing `View3D` instance to configure:

	context = new Context().extend(MVCSBundle, Away3DViewMapExtension).configure(Config, this, _view);

So completing initialization of extensions will first trigger `Setup3DSceneCommand`. In that command, sample object is placed on scene and its mediator is created.

Clicking on plane on scene will dispatch custom view event which is caught in its mediator. Mediator will then dispatch `SampleEvent` which is in turn tied to `SampleCommand`.Then, event is dispatched for mediator to catch and instruct view to update color.