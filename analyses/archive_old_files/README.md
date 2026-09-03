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
   `4_land_use_changes_agnostic.Rmd` and is now the active notebook in
   `analyses/`.

## Dated snapshots

**`4_land_use_changes_agnostic_DDMMYYYY.Rmd`** — a snapshot of the then-active
`analyses/4_land_use_changes_agnostic.Rmd`, taken immediately before a
significant change, so the before/after can be compared later.

- `4_land_use_changes_agnostic_03092026.Rmd` — snapshot taken 2026-09-03,
  just before adding a second input backend (`geotiff_dir`) so the agnostic
  notebook can also process `PLUM_Alexander` (id99, HILDA+-harmonised,
  pre-coarsened 0.5° GeoTIFFs), previously handled by its own dedicated
  notebook, `5_land_use_changes_PLUM_Alexander.Rmd`.
