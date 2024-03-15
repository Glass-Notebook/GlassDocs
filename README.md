# GlassDocs

[![Glass Notebook](https://img.shields.io/badge/Docs-Glass%20Notebook-aquamarine.svg)](https://glassnotebook.io/r/g7gi-y9zvTVvRLrmptnbP/index.jl)

Welcome to GlassDocs.jl, the comprehensive docs for the Glass Notebook - a seamless way to publish interactive Pluto.jl notebooks directly from your GitHub repositories.

## Introduction

Glass Notebook integrates with GitHub to allow effortless syncing of repositories for the automatic publishing of Pluto notebooks. This system is designed to convert notebooks into detailed documentation or tutorials with minimal hassle. With the addition of git submodules, Glass Notebook facilitates the creation of a meta-documentation system that amalgamates various tutorials, packages, and documents into one cohesive resource.

## Features

- **GitHub Integration**: Synchronize your Pluto.jl notebooks with GitHub repositories.
- **Automatic Publishing**: Turn your notebooks into static and interactive formats with ease.
- **Documentation Generation**: Automatically generate sidebars and organize documents based on the filesystem structure.
- **Meta Documentation**: Combine multiple repositories into a unified documentation ecosystem.

# Pluto Notebooks for GlassDocs.jl Documentation

The following is a series of Pluto notebooks designed to provide comprehensive documentation for Glass Notebook. Each notebook is a step-by-step guide covering different aspects of using Glass, from getting started to advanced usage.

## Notebook Series Outline

1. **01_getting_started.jl**
    - Introduction to Glass Notebook
    - Installation and setup
    - Creating your first notebook
    - Syncing with GitHub
    - Publishing your first notebook

2. **02_advanced_usage.jl**
    - Combining multiple packages into a single documentation
    - Using git submodules for creating meta documentation
    - Customizing the sidebar
    - Tips for writing effective documentation in Pluto notebooks

## Structure of the Repository

This section provides an overview of the repository structure, including directories for documentation, examples, and teaching materials, as well as git submodules for external content.

### Directory Structure

```
/GlassDocs
├── CalciumScoring.jl            # Git submodule package, containing Glass Notebook package docs
├── ComputerVisionTutorials.jl   # Git submodule package, containing Glass Notebook meta-docs
├── DistanceTransforms.jl        # Git submodule package, containing Glass Notebook package docs
├── Losers.jl                    # Git submodule package, containing Glass Notebook package docs
├── PlutoDashboards              # Git submodule package, containing Glass Notebook package docs
├── TidierCourse                 # Git submodule package, containing Glass Notebook package docs
├── /assets                      # Images and other static assets for the documentation
├── .gitignore                   # Basic .gitignore file
├── .gitmodules                  # Git submodule file
├── .glassignore                 # File that tells Glass Notebook which pluto notebooks to ignore
├── 01_getting_started.jl        # How to: link to GitHub, export basic notebooks, etc.
├── 02_advanced_usage.jl         # Advanced tutorials: simple docs, meta-docs, nested meta docs, etc.
├── Manifest.toml
├── Project.toml
├── README.md
├── index.jl                     # Homepage notebook for GlassDocs
├── structure.json               # JSON file to customize the sidebar exported in Glass Notebook
└── unseen_notebook.jl           # Sample notebook that gets ignored by glass via `.glassignore`
```

## Examples as Git Submodules

This repository includes several examples as git submodules to demonstrate how Glass can be used in various contexts:

- **Package Docs**: Documentations of Julia packages made interactive through Glass.
- **Tutorials**: Step-by-step guides to using specific features or packages.
- **Teaching**: Educational materials and coursework documentation.
- **Meta Docs**: Comprehensive documentation projects that include several of the above categories.

## Contact
Join us on the [Julia Zulip](https://julialang.zulipchat.com/#narrow/stream/428178-glassnotebook)

## Acknowledgements

- [Pluto.jl](https://github.com/fonsp/Pluto.jl)



