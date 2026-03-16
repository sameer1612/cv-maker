# cv-maker

> **YAML in. Polished PDF CV out.**

cv-maker takes a structured YAML profile and renders it into a professionally typeset PDF — no fiddling with Word templates or LaTeX boilerplate. Powered by [RenderCV](https://rendercv.com) and Python.

---

## How it works

| Step | What happens                                     |
| ---- | ------------------------------------------------ |
| 1    | Write your profile in `data/<name>_profile.yaml` |
| 2    | Run `uv run main.py data/<name>_profile.yaml`    |
| 3    | Find the generated PDF in `profiles/`            |

Your profile YAML is automatically merged with `data/config.yaml` (shared theme & layout settings) before rendering.

---

## Quick start

**1. Install dependencies**

```bash
uv sync
```

**2. Generate your CV**

```bash
# Use a specific profile
uv run main.py data/profile.yaml

# Falls back to data/profile.yaml when no argument is given
uv run main.py
```

Output is written to `profiles/<Name>_CV.pdf`.

---

## Profile format

```yaml
cv:
  name: Jane Doe
  sections:
    about:
      - A short professional summary.
    experience:
      - company: Acme Corp
        position: Senior Engineer
        start_date: 2022-01
    skills:
      - label: Languages
        details: Python, TypeScript, Go
```

See [`data/profile.yaml`](data/profile.yaml) for a full working example.

---

## Requirements

- Python ≥ 3.13
- [uv](https://github.com/astral-sh/uv) package manager
