# GlassDocs

[![Glass Notebook](https://img.shields.io/badge/Docs-Glass%20Notebook-aquamarine.svg)](https://glassnotebook.io/r/fPuxqzHi6mmOvzXwVNxuK/index.jl)

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

2. **02_basic_operations.jl**
    - Creating new documents
    - Editing and saving changes
    - Structuring notebooks for sidebar generation
    - Overview of the documentation generation process

3. **03_advanced_usage.jl**
    - Combining multiple packages into a single documentation
    - Using git submodules for creating meta documentation
    - Customizing the sidebar
    - Tips for writing effective documentation in Pluto notebooks

4. **04_repository_structure.jl**
    - Understanding the GlassDocs repository structure
    - How to organize your documentation for clarity and ease of navigation
    - Best practices for file and folder naming conventions

## Structure of the Repository

This section provides an overview of the repository structure, including directories for documentation, examples, and teaching materials, as well as git submodules for external content.

### Directory Structure

```
/GlassDocs
├── /docs
│   ├── /tutorials          # Tutorials using Glass
│   │   └── tutorial1.jl    # Example tutorial
│   ├── /examples           # Examples as git submodules
│   │   ├── /package_docs   # Documentation for packages
│   │   │   └── submodule1  # Git submodule to package documentation
│   │   ├── /teaching       # Materials for teaching
│   │   │   └── submodule2  # Git submodule to teaching material
│   │   ├── /meta_docs      # Meta documentation combining multiple sources
│   │   │   └── submodule3  # Git submodule to meta documentation
│   │   └── /more_examples  # Additional examples
│   │       └── submodule4  # Git submodule to other examples
│   └── sidebar.md          # Sidebar markdown for navigation
├── /src
│   └── GlassNotebook.jl    # Source code for Glass Notebook
├── /test
│   └── runtests.jl         # Test scripts for Glass Notebook
├── .gitmodules             # Git submodules for external content
├── Project.toml            # Project dependencies and versioning
└── README.md               # README for the repository
```

## Examples as Git Submodules

This repository includes several examples as git submodules to demonstrate how Glass can be used in various contexts:

- **Package Docs**: Documentations of Julia packages made interactive through Glass.
- **Tutorials**: Step-by-step guides to using specific features or packages.
- **Teaching**: Educational materials and coursework documentation.
- **Meta Docs**: Comprehensive documentation projects that include several of the above categories.

## Contact

Your Name – [@your_twitter](https://twitter.com/your_twitter) - email@example.com

Project Link: [https://github.com/your_username/GlassDocs.jl](https://github.com/your_username/GlassDocs.jl)

## Acknowledgements

- [Pluto.jl](https://github.com/fonsp/Pluto.jl)



