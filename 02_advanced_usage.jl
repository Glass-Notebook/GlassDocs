### A Pluto.jl notebook ###
# v0.19.36

#> [frontmatter]
#> title = "Advanced Usage"
#> category = "Tutorials"

using Markdown
using InteractiveUtils

# ╔═╡ 46581809-1673-45c7-8cc1-40bf12b2a8d7
# ╠═╡ show_logs = false
using Pkg; Pkg.activate("."); Pkg.instantiate()

# ╔═╡ 463236e3-f8e0-4748-bbfc-4a4331c61ea6
# ╠═╡ show_logs = false
using PlutoUI

# ╔═╡ f4914413-531e-408f-85bc-87448e9c2987
TableOfContents()

# ╔═╡ 9db1c05e-c47c-42a5-afea-041344a12ad2
md"""
# Advanced Usage

[Glass Notebook](https://glassnotebook.io/) automatically publishes Pluto notebooks into interactive (or static) websites. Advanced users can take advantage of this to customize the sidebar, homepage, along with many other features explored below:
"""

# ╔═╡ d3942b60-f85a-439d-98f4-8f4da24b830a
md"""
## Glass Ignore Export (`.glassignore`)

Glass Notebook automatically indexes every Pluto notebook contained within a GitHub repository. These notebooks will then be exported by Glass. If certain notebooks are not meant for export, they can be included in a `.glassignore` file. This file will tell glass to ignore any notebooks in the repository that match the string given - which follows the same regex rules as `.gitignore` on GitHub

For example, say you want to ignore the notebook located at the path `Repository.jl/test/expensive_notebook.jl`. Any of the following entrants in the `.glassignore` file would successfully tell Glass Notebook to avoid the `expensive_notebook.jl` when exporting:

```bash
# example .glassignore file:

**expensive_notebook.jl
Repository.jl/test/expensive_notebook.jl
# etc...
```
"""

# ╔═╡ 43c3c5c8-95bd-471e-b091-ed5f794ea0e2
md"""
## Sidebar

When exporting, Glass will automatically create a sidebar for nice navigation. This sidebar will, by default, be the name of the files and their relative paths. To enhance the user experience Glass also allows for customization via the built-in `edit frontmatter` button in Pluto. All that is required is to change the title of the notebook via `edit frontmatter`, and the sidebar will automatically adjust during the next export. 
"""

# ╔═╡ 0dec2a94-2c4f-4e4a-911d-9ab6c1a3605a
save_pluto_url = "https://github.com/Dale-Black/GlassDocs/blob/master/assets/savepluto.jpeg?raw=true"; edit_frontmatter_url = "https://github.com/Dale-Black/GlassDocs/blob/master/assets/editfrontmatter.jpeg?raw=true"; frontmatter_url = "https://github.com/Dale-Black/GlassDocs/blob/master/assets/frontmatter.jpeg?raw=true";

# ╔═╡ 0cc279d4-a7ab-4642-8a48-7cb6581b94c2
html"""<hr/>"""

# ╔═╡ b6eeed20-b3cf-4e5e-94c6-d4cc0fb06f50
Resource(save_pluto_url)

# ╔═╡ d891860e-90aa-4ace-b53b-58d296e36ed1
html"""<hr/>"""

# ╔═╡ c96cdb99-91c0-4c42-b7d9-740ed3572a57
Resource(edit_frontmatter_url)

# ╔═╡ 9d43007b-a74e-42f8-9ae8-f5e174e2dc0e
html"""<hr/>"""

# ╔═╡ 636d99a6-756e-471f-9fdf-1d250f1562cf
Resource(frontmatter_url)

# ╔═╡ 2f6e3719-0a80-4c77-968f-ff9f635c6889
html"""<hr/>"""

# ╔═╡ 880a2808-afc5-45e8-9158-98d4c20fb808


# ╔═╡ 4b2f8bda-a3c1-4ccd-92e8-fb19badef84f
md"""
## Homepage (`index.jl`)

Any notebook titled `index.jl` is treated nearly the same as all the other notebooks (can be named, etc), except it is automatically given priority with regard to sorting the sidebar. Typically, files on the sidebar would be sorted in two steps - (1) files come before folders, (2) everything else is in alphabetical order. The only exception is `index.jl` files. These can be given any title for the sidebar, but they will always appear first on the sidebar.

Notice how `Home` appears first below. This is an `index.jl` so the name doesn't matter. This will always be the first on the sorting list.
"""

# ╔═╡ 6ca67d2c-7809-4026-aabb-e2e38465210d
index_url = "https://github.com/Dale-Black/GlassDocs/blob/master/assets/index.jpeg?raw=true";

# ╔═╡ 69201461-d1ee-4e4d-b17e-459508748967
Resource(index_url)

# ╔═╡ 1de7c073-36d0-4f29-80d8-5c56d0cbf23f
md"""
## Links

Links work inside markdown like normal and relative links (e.g. `[link to other notebook](/docs/other_notebook.jl)`) will be automatically parsed and linked properly in Glass
"""

# ╔═╡ 7b8cc940-fbba-42ed-b5b7-30abca9feb99
md"""
## Notebook Export Options

Glass Notebook provides different export options to accommodate various user needs, ranging from simple viewing to full interactivity with real-time data handling capabilities.

| Notebook Type | Interactivity Level | Data Injection Capability | Relative Cost |
|---------------|---------------------|---------------------------|---------------|
| Static Notebooks| None | No | Lowest |
| Precomputed Notebooks| Interactive UIs | No | Medium |
| Fully Interactive | Full | Yes (e.g., data uploads)| Highest |
"""

# ╔═╡ e3b98336-7c90-4a5c-a09c-b3d6297506e3
md"""
## Meta-Docs

The `structure.json` file in Glass Notebook is a crucial tool for crafting a custom sidebar for your documentation. It's especially valuable when your documentation integrates multiple repositories or has complex structures.

### Git Submodules and `structure.json` in Glass Notebook

- **Git Submodules**: These are used to incorporate separate repositories as part of your project while keeping their individual commit histories. In Glass Notebook, submodules enable you to include content from various repositories into a single comprehensive documentation system.

- **`structure.json`**: This is a configuration file used to explicitly define the structure of the sidebar. It allows for more detailed organization than the default automatic indexing, enabling you to create a customized layout for your documentation.

### Example `structure.json`

Below is an example of a `structure.json` file, which outlines a sidebar with various components including nested folders and references to git submodules:

```json
{
	"sidebar": {
		"title": "GlassDocs.jl",
		"elements": [
			{
				"type": "notebook",
				"path": "index.jl",
				"title": "Home"
			},
			{
				"type": "folder",
				"title": "Tutorials",
				"defaultOpened": false,
				"elements": [
					{
						"type": "notebook",
						"path": "01_getting_started.jl",
						"title": "Getting Started"
					},
					{
						"type": "notebook",
						"path": "02_advanced_usage.jl",
						"title": "Advanced Usage"
					}
				]
			},
			{
				"type": "folder",
				"title": "Examples",
				"defaultOpened": false,
				"elements": [
					{
						"type": "folder",
						"title": "Package Docs",
						"defaultOpened": false,
						"elements": [
							{
								"type": "folder",
								"title": "Losers.jl",
								"path": "Losers.jl",
								"defaultOpened": false
							},
							{
								"type": "folder",
								"title": "DistanceTransforms.jl",
								"path": "DistanceTransforms.jl",
								"defaultOpened": false
							}
						]
					},
					{
						"type": "folder",
						"title": "Tutorials",
						"defaultOpened": false,
						"elements": []
					},
					{
						"type": "folder",
						"title": "Teaching",
						"defaultOpened": false,
						"elements": []
					},
					{
						"type": "folder",
						"title": "Meta Docs",
						"defaultOpened": false,
						"elements": []
					}
				]
			}
		]
	}
}
```

The `structure.json` file shapes the sidebar for GlassDocs.jl documentation. The structured layout includes:

- **Home Section:** Linking to `index.jl`, serving as the homepage.
- **Tutorials Section:** A collapsible folder with links to "Getting Started" and "Advanced Usage".
- **Examples Section:** A collapsible folder with sub-folders for "Package Docs", "Tutorials", "Teaching", and "Meta Docs". 

These collapsible folders help to manage space and maintain an organized layout, especially beneficial for extensive documentation. Users can expand these folders to access specific content.

### Implementing `structure.json`

To utilize this feature:

1. Create a `structure.json` file at the root of your Glass Notebook repository.
2. Follow the example format to define your sidebar structure.
3. Add external repositories as git submodules.
4. Reference the path to notebooks and submodules relative to the root of your main repository.

This custom sidebar structure enhances the navigation experience for users exploring your documentation on Glass Notebook.
"""


# ╔═╡ Cell order:
# ╠═46581809-1673-45c7-8cc1-40bf12b2a8d7
# ╠═463236e3-f8e0-4748-bbfc-4a4331c61ea6
# ╠═f4914413-531e-408f-85bc-87448e9c2987
# ╟─9db1c05e-c47c-42a5-afea-041344a12ad2
# ╟─d3942b60-f85a-439d-98f4-8f4da24b830a
# ╟─43c3c5c8-95bd-471e-b091-ed5f794ea0e2
# ╟─0dec2a94-2c4f-4e4a-911d-9ab6c1a3605a
# ╟─0cc279d4-a7ab-4642-8a48-7cb6581b94c2
# ╟─b6eeed20-b3cf-4e5e-94c6-d4cc0fb06f50
# ╟─d891860e-90aa-4ace-b53b-58d296e36ed1
# ╟─c96cdb99-91c0-4c42-b7d9-740ed3572a57
# ╟─9d43007b-a74e-42f8-9ae8-f5e174e2dc0e
# ╟─636d99a6-756e-471f-9fdf-1d250f1562cf
# ╟─2f6e3719-0a80-4c77-968f-ff9f635c6889
# ╟─880a2808-afc5-45e8-9158-98d4c20fb808
# ╟─4b2f8bda-a3c1-4ccd-92e8-fb19badef84f
# ╟─6ca67d2c-7809-4026-aabb-e2e38465210d
# ╟─69201461-d1ee-4e4d-b17e-459508748967
# ╟─1de7c073-36d0-4f29-80d8-5c56d0cbf23f
# ╟─7b8cc940-fbba-42ed-b5b7-30abca9feb99
# ╟─e3b98336-7c90-4a5c-a09c-b3d6297506e3
