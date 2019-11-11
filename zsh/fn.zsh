function cnotes {
  local name="notes"

  if [ "$#" -gt 0 ]; then
    name=$1
  fi

  pandoc --from=markdown+raw_html+markdown_in_html_blocks \
    -V fontsize=10pt \
    --variable urlcolor=blue \
    $name.md \
    -o $name.pdf
}
