"use strict";function e(e){return e&&"object"==typeof e&&"default"in e?e:{default:e}}var t=e(require("postcss-value-parser"));const o=["woff","truetype","opentype","woff2","embedded-opentype","collection","svg"],r=e=>{const r="preserve"in Object(e)&&Boolean(e.preserve);return{postcssPlugin:"postcss-font-format-keywords",AtRule:{"font-face"(e){"font-face"===e.name&&e.walkDecls("src",(e=>{if(!e.value.includes("format("))return;const s=t.default(e.value);s.walk((e=>{"function"===e.type&&"format"===e.value&&e.nodes.forEach((e=>{"word"===e.type&&o.includes(e.value)&&(e.value=t.default.stringify({type:"string",value:e.value,quote:'"'}))}))})),r?e.cloneBefore({value:s.toString()}):e.value=s.toString()}))}}}};r.postcss=!0,module.exports=r;
