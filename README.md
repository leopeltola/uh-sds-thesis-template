# University of Helsinki Social Data Science Thesis Quarto Template

Uses Quarto's Typst for pdf rendering (instead of LaTeX). 

## Installing

```bash
quarto use template leopeltola/uh-sds-thesis-template
```

This installs the format extension and creates `template.qmd` (renamed to your
project) as a starting point.

To add the format to an existing project instead:

```bash
quarto add leopeltola/uh-sds-thesis-template
```

## Using

See `index.qmd` for an example, and `_quarto.yml` for the format options.
Chapters live in `chapters/` and are pulled into the main file with the
`include` shortcode.

Supported metadata: `title`, `subtitle`, `author`, `date`, `location`,
`major-track`, `supervisor`, `keywords`, `abstract`, `logo-path`.

## LICENSE

MIT, except for:

- The bundled logo is the official University of Helsinki Faculty of Social
  Sciences logo. It is **not** covered by the MIT license
