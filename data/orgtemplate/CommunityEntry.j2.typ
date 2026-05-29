#two-col-entry(
  left-content: [
    *<<entry.title>>*,
    ((* if entry.description *))
    <<entry.description>>((* endif *))
  ],
  right-content: [
    ((* if entry.url *))#link("<<entry.url>>")[((*- if entry.link_label -*))<<entry.link_label>>((*- else -*))<<entry.url|make_a_url_clean>>((*- endif -*))]((* endif *))
  ],
)
