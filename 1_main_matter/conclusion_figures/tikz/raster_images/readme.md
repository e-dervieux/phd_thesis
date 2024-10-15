To keep the manuscript small enough, all heatmaps were first rendered as PNG using Python's matplotlib library and then integrated to a vectorial frame using TikZ / PGFPlots.

---

Comparison in the case of the CO2 saturation heatmap :

  - Using a CSVs of three dimensional coordinates and TikZ / PGFPlots produced a 8.2MB PDF (not mentioning the 5min compilation time)
  - Compressing the latter using ghostscript yielded a 2.8MB PDF
  - At the opposite matplotlib's PNG weighted only 84KB (upscaled by 2 to avoid [pdf-viewer-related blurring](https://tex.stackexchange.com/questions/10975/my-pixel-perfect-picture-gets-blurry-when-compiled-in-latex))
  - When integrated into a vectorial frame the resulting figure weighted 100KB

---

Thus, despite raster images being evil and vector graphics kicking asses, I finally settled to this compromise for the sake of having a lightweight manuscript.