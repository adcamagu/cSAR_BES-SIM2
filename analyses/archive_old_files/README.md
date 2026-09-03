# archive_old_files

Superseded and snapshot copies of the `analyses/4_land_use_changes*` notebook,
kept for reference only. None of these are used by the pipeline — the active
notebook is `analyses/4_land_use_changes_agnostic.Rmd`.

## Superseded versions (evolution of the step-04 notebook)

Chronological order, each superseded by the next:

1. **`4_land_use_changes_specific.Rmd`** — the original notebook. Hardcoded to
   GLOBIO only, no model switch, no config file.
2. **`4_land_use_changes_agnostic_no_yaml.Rmd`** — first attempt at
   generalizing across models via a `model_key` switch, but cube paths and
   model metadata were still hardcoded inline in the `.Rmd` (hence "no_yaml").
3. **`4_land_use_changes_agnostic.Rmd`** — first config-driven version: reads
   `config/category_map.yaml` for per-model cube path, entity mapping, and
   metric filter, so switching models is a single line. Later refined
   (previously known as `..._agnostic_3.Rmd` during development) to reuse a
   single fraction read for both the percentage-point and km² outputs
   instead of reading each entity twice. That refined version was renamed to
   `4_land_use_changes_agnostic.Rmd`, later renumbered to
   `04_land_use_changes_agnostic.Rmd`, and is now the active notebook in
   `analyses/`.

## Dated snapshots

**`4_land_use_changes_agnostic_DDMMYYYY.Rmd`** — a snapshot of the then-active
`analyses/4_land_use_changes_agnostic.Rmd`, taken immediately before a
significant change, so the before/after can be compared later.

- `4_land_use_changes_agnostic_03092026.Rmd` — snapshot taken 2026-09-03,
  just before adding a second input backend (`geotiff_dir`) so the agnostic
  notebook can also process the id99 HILDA+-harmonised, pre-coarsened 0.5°
  GeoTIFF dataset (`model_key <- "PLUM_harmonised"` in the YAML), previously
  handled by its own dedicated notebook, `5_land_use_changes_PLUM_Alexander.Rmd`.

## Retired step-05 notebook

**`5_land_use_changes_PLUM_Alexander.Rmd`** (+ its `.nb.html` render) — the
dedicated notebook that processed the id99 HILDA+-harmonised PLUM/Alexander
GeoTIFFs (7-entity scheme: Urban, Cropland, Pasture, Forest managed, Forest
unmanaged, Grass/shrubland, Other land). Its logic was folded into
`4_land_use_changes_agnostic.Rmd` on 2026-09-03 as a new `geotiff_dir` input
backend, selectable via `model_key <- "PLUM_harmonised"` — see the `TODO /
TEMPORARY` notes in that notebook's section 0 and in
`config/category_map.yaml` (this GeoTIFF backend is meant to be replaced by
a proper EBVcube read once one exists for this dataset). Archived here once
the merged version was confirmed to reproduce this notebook's output.
