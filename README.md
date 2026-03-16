# cv-maker

A simple CV maker built with python. 
It allows users to input their personal information, work experience, education, and skills, and generates a professional CV as a PDF.

Input: data/xyz_profile.yaml
Output: output/xyz_cv.pdf

## Install using uv

```bash
uv sync
```

## Run the application

```bash
uv run main.py <path to cv yaml file>
```

## Example

```bash
uv run main.py data/xyz_profile.yaml
```

This will use data/profile.yaml as input and generate the cv.
```bash
uv run main.py
```

