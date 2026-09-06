
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Sameer Kumar"
#let locale-catalog-page-numbering-style = context { "Sameer Kumar - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Jan 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 1.5cm
#let design-section-titles-vertical-space-below = 0.7cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 9.5pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Open Sans"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = false
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-vertical-space-between-name-and-connections = 0cm
#let design-header-vertical-space-between-connections-and-first-section = 1cm
#let design-header-use-icons-for-connections = false
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = left
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.5cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 2em
#let design-entries-date-and-location-width = 5.5cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 1.5cm
#let design-page-bottom-margin = 1.5cm
#let design-page-left-margin = 1.5cm
#let design-page-right-margin = 1.5cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 2cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #set text(hyphenate: false); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  set text(fill: design-colors-connections)
  set par(leading: design-text-leading*1.7, justify: false)
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

#two-col(
  left-column-width: 90%,
  right-column-width: 10%,
  column-gutter: 1cm,
  left-content: [
    #align(
      left,
      [
        = Sameer Kumar
      ]
    )
  ],
)

// Print connections:
#let connections-list = (
)
#connections(connections-list)


== About

#one-col-entry(
  content: [A systems-focused architect and engineering leader who pairs deep platform engineering with applied AI and agentic workflows — building in-house ML models, AI-assisted migrations, and clean, maintainable systems — while owning the hardest parts along the way.]
)


== Highlights

#one-col-entry(
  content: [- Designed platform architectures spanning AI systems, healthcare integrations, enterprise SaaS platforms, and large-scale modernization initiatives.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- 8+ years of experience designing, modernizing, and scaling enterprise software platforms, with a growing focus on AI/LLM-driven systems.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Led modernization programs spanning monolith decomposition, cloud adoption, and architectural transformation.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- RubyConf India speaker and technical author with 100K+ reads on engineering and consulting topics.],
)


== Experience

#two-col-entry(
  left-content: [
    #[*Zensar Technologies*], Senior Engineering Lead

    
  ],
  right-content: [
    Pune, India \(Remote\)

July 2026 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #[*Sedin Technologies*], Senior Technical Consultant

    
  ],
  right-content: [
    Bengaluru, India

May 2021 – July 2026
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #[*Mindfire Solutions*], Software Engineer

    
  ],
  right-content: [
    Bhubaneswar, India

Apr 2019 – May 2021
  ],
)



== Skills

#one-col-entry(
  content: [#[*Languages:*] Dart, Elixir, Java, JavaScript, Python, TypeScript, Ruby]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*Databases:*] Firebase/Firestore, MongoDB, MySQL, Oracle, PostgreSQL, SQLite]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*Frameworks:*] Angular, Django, Express, FastAPI, Flask, Flutter, NestJS, React/Next.js, Ruby on Rails, Vue]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*UI & Design:*] Bootstrap, Figma, PrimeFaces, Material, Mantine, Radix, SCSS, Tailwind]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*DevOps:*] AWS, Docker, GCP, GitHub, GitLab, Jira/Bitbucket]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*AI/LLM:*] Claude, GPT, Gemini, Agentic Workflows, MCP, RAG/Vector Search, Knowledge Graphs, Prompt & Context Engineering, AI Evaluation, Sentiment Analysis]
)


== Projects


#one-col-entry(
  content: [
    #[*AICrete \(US\)*]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Integrated in-house AI models for aggregate classification and structural property estimation from concrete sample images.],[Built the entire React/Remix frontend using agentic coding workflows with Claude.],[Used AI-driven translation workflows and custom Claude skills to migrate the platform to French with i18n.],[Used AI-assisted analysis to decompose the Django monolith into a REST API architecture, enabling incremental frontend migration.],[Accelerated test coverage development using AI-assisted workflows, reducing manual engineering effort while improving release confidence.],[Optimized heavy analytics and table queries for up to 10x speed and memory improvement, using EXPLAIN ANALYZE-driven query analysis.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #[*Vidura \(IN\)*]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Built an org-wide chat utility that ingested various types of documents into vector databases with metadata indexes for retrieval.],[Answered natural-language queries against an ever-growing organizational knowledge base using RAG.],[Rendered responses dynamically as text, charts, or tables depending on the query.],[Supported read-only natural-language queries directly against the PostgreSQL database.],[Enforced access-level security to protect sensitive data across users with different permission tiers.],[Generalized the platform into a domain-aware system that could integrate with any knowledge base.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #[*Subscribili \(IN\)*]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Used AI-assisted tooling to migrate a large legacy JavaScript codebase to a modern TypeScript structure.],[Converted Figma designs directly to code using MCP-based workflows.],[Built dental subscription-management dashboards for patients and providers, unified in a composable, plug-and-play monorepo.],[Designed a bespoke component system using Radix and Tailwind.],[Implemented caching strategies to enhance UX and contributed to the platform's microservice migration.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #[*KCH \(UAE\)*]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Used AI-assisted code analysis to reverse-engineer business logic from a 20-year-old Windows-based EHR system to an on-prem private cloud.],[Re-architected the application from HL7 to FHIR protocol and setup multi environment deployments.],[Delivered Oracle Millennium FHIR integration for custom OAuth, patient data, and appointment management.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #[*Collectively - theAmplify \(US\)*]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Built an NLP utility for sentiment analysis, user clustering, and topic weighting using Google AutoML and Ernie RPC-based servers.],[Developed ML-driven services for creator analysis — anomaly detection, demographics analysis, and content sanity checks — in Ruby and Python.],[Built data-visualization dashboards using Google Data Studio and Looker to surface social media and influencer performance in real time.],[Upgraded a Rails v4 application to a modern Webpacker-based Rails 6 setup and integrated SSR React for complex interactivity.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #[*SITA - DigiHub \(EU\)*]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Led the front-end team building a multinational airline and airport data-aggregation platform.],[Migrated the platform to Angular v18 with a microservices approach, sourcing data from Microsoft, ServiceNow, and Salesforce.],[Integrated Azure B2C auth, storage, Power BI, and SharePoint.],[Led a brand-level redesign, implemented as an Angular component library using PrimeNG and Tailwind.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #[*GAEA - Exto \(IN\)*]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Built an adaptive scheduling algorithm for activities and resources in the project management system.],[Modernized a legacy Express codebase and implemented a policy-based authorization layer for access control and user impersonation.],[Developed the v2 backend with MongoDB and NestJS, retrofitting Jest and Playwright test coverage.],[Implemented the new scheduling UI with Angular, Bryntum Gantt, and PrimeNG.],)
  ],
)



== Education

// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 2cm,
  left-content: [#[*B.Tech*]],
  middle-content: [
    #[*Silicon University*], Computer Science and Engineering

    
  ],
  right-content: [
    Bhubaneswar, India

2015 – 2019
  ],
)



== Community

#two-col-entry(
  left-content: [
    *Speaker*,
    RubyConf India 2022 & 2025  ],
  right-content: [
#link("https://www.youtube.com/watch?v=SJL9-nZIysA")[DSLs in Ruby]  ],
)
#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    *Technical Blog*,
    100K+ reads on engineering & consulting topics  ],
  right-content: [
#link("https://sameer-kumar-1612.medium.com")[Medium Articles]  ],
)


== Socials

#one-col-entry(
  content: [#[*Email:*] kumar.sam1612\@gmail.com]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*LinkedIn:*] https://www.linkedin.com/in/sameerkumar1612]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*Github:*] https://github.com/sameer1612]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*Medium:*] https://sameer-kumar-1612.medium.com]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*Phone:*] +918117804649]
)


