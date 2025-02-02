⚠️ The use of mask and maskfence is not recommended. After configuring 2.14.x, the version will take effect.

Template layer: a layer used as a template. PointLayer, LineLayer, and PolygonLayer can all be used as templates.
Mask layer: the layer cut by the template

### maskLayers

Mask layer takes effect

<description> *array Layer* **optional** *default:*\[]</description>

### enableMask

Mask layer takes effect

Whether to enable the mask. It is enabled by default. It will take effect when maskLayers is not empty.

<description> *bool* **optional** *default:* true</description>

### maskInside

```
Mask layer takes effect
```

<description> *boolean* **optional** *default:* true</description>

Used to describe the content of the current layer and mask boundary display.

* `true`Show inside the mask
* `false`Show outside mask

### maskOpetation mask method

Template layer takes effect<description> *enumerate* **optional** *default:* and</description>It is invalid when there are multiple maskLayers and needs to be set on the template layer.

* or intersection
* and union

Usage example

```ts
const polygonLayer = new Polygon();
 const rasterLayer = new Raster({ // Raster layer uses polygon mask
    maskLayers:[polygonLayer],
    enableMask:true,
    maskInside: true,
 
 });
```
