#define LineTypeSolid 0.0
#define LineTypeDash 1.0
#define Animate 0.0
uniform float u_blur : 0.9;
uniform float u_line_type: 0.0;
uniform float u_opacity : 1.0;
varying vec4 v_color;
varying vec2 v_normal;


// dash
uniform float u_dash_offset : 0.0;
uniform float u_dash_ratio : 0.1;
varying float v_distance_ratio;
varying vec2 v_dash_array;
varying float v_side;


#pragma include "picking"

uniform float u_time;
uniform vec4 u_aimate: [ 0, 2., 1.0, 0.2 ];
// [animate, duration, interval, trailLength],
void main() {
  gl_FragColor = v_color;
  // anti-alias
  float blur = 1.- smoothstep(u_blur, 1., length(v_normal.xy)) * u_opacity;
  // gl_FragColor.a *= blur;

  if(u_aimate.x == Animate) {
      float alpha =1.0 - fract( mod(1.0- v_distance_ratio, u_aimate.z)* (1.0/ u_aimate.z) + u_time / u_aimate.y);
      alpha = (alpha + u_aimate.w -1.0) / u_aimate.w;
      alpha = smoothstep(0., 1., alpha);
      float alpha2 = exp(-abs(v_side));
      gl_FragColor.a *= alpha * blur * alpha2;
      // gl_FragColor.a = fract(u_time);
  }
 // dash line
  if(u_line_type == LineTypeDash) {
    gl_FragColor.a *= blur  * (1.0- step(v_dash_array.x, mod(v_distance_ratio, v_dash_array.x +v_dash_array.y)));
  }

  gl_FragColor = filterColor(gl_FragColor);
}