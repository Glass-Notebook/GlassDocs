### A Pluto.jl notebook ###
# v0.19.38

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

# ╔═╡ 86c5a306-58d2-49e8-bed8-028ad8212a8a
md"""
# Advanced Usage of Glass Notebook

[Glass Notebook](https://glassnotebook.io/) offers a versatile platform for publishing Pluto notebooks as interactive or static websites. It caters to a wide range of users, from those seeking simple documentation to advanced users who require interactive features and real-time data handling. Below, we explore the various customizations and export options available in Glass Notebook, designed to enhance user experience and meet diverse needs.

## Notebook Export Options

Understanding the export options in Glass Notebook is key to utilizing its full potential. Users can choose from different notebook types depending on their requirements for interactivity and data handling. Here’s an overview of the available options:

| Notebook Type         | Interactivity Level | Data Injection Capability | Relative Cost |
|-----------------------|---------------------|---------------------------|---------------|
| Static Notebooks      | None                | No                        | Lowest        |
| Precomputed Notebooks | Interactive UIs     | No                        | Medium        |
| Fully Interactive     | Full                | Yes (e.g., data uploads)  | Highest       |

- **Static Notebooks**: Ideal for basic viewing needs, these notebooks offer no interactivity or data injection but come at the lowest cost.
  
- **Precomputed Notebooks**: These provide interactive user interfaces without real-time data capabilities, striking a balance between interactivity and cost.

- **Fully Interactive Notebooks**: For the most advanced usage, these notebooks offer full interactivity with real-time data handling capabilities, such as data uploads, making them suitable for complex applications.

This section aims to guide users in selecting the right type of notebook export to match their specific project requirements, ensuring efficient and effective use of Glass Notebook’s features.

"""

# ╔═╡ a5ee549f-f9d8-4078-8808-c1f267d3d779
md"""
# Navigation

Glass Notebook offers a multi-tiered navigation system for organizing and presenting documentation or other types of material:

1. **Automatic Sidebar Navigation**: The first level of Glass Notebook's navigation is user-friendly and requires no customization. In this mode, Glass Notebook automatically generates a sidebar for navigation. This sidebar is created based on the names of the Pluto notebooks used. This feature is particularly useful for users who prefer a hands-off approach and still want a well-organized and accessible documentation structure. An example of this can [be seen here](https://glassnotebook.io/r/DxnIPJnIqpEqiQnJgqiBP/index.jl).

2. **Customizable Meta-Docs Navigation**: The second level of navigation introduces more customization. It caters to meta-docs, which are documents that contain nested documentation from other packages. Users can tailor the sidebar navigation to their needs using a `structure.json` file and nested git submodules (which consist of repositories with their own relevant Pluto notebooks). This level is ideal for users who want to show how multiple repositories can be linked together [as seen here](https://glassnotebook.io/r/zQzph_NEw8WtbYAquAQG3/index.jl).

3. **Integrated Navigation Across Multiple Meta-Docs (Upcoming)**: The third level, which is forthcoming, promises an even more advanced navigation feature. It allows users to combine multiple meta-docs into a unified interface using a `navbar.json` file and nested git submodules (which consist of meta-doc repositories). This level is designed to provide a seamless way to link numerous meta-docs together, facilitating easier access and navigation across a broader range of documentation. While an example is not yet available, this feature is expected to significantly enhance the usability and interconnectedness of complex documentation systems.

Each level of Glass Notebook’s navigation system is designed to cater to different user needs, from basic, automatic organization to more complex, interconnected documentation structures.
"""

# ╔═╡ 43c3c5c8-95bd-471e-b091-ed5f794ea0e2
md"""
## 1. Simplified Sidebar Navigation

**Automatic Sidebar Creation and Customization**: At this initial level, Glass Notebook automates the creation of a sidebar for easy navigation. The sidebar titles default to the names of the files and their paths. For further customization, users can modify the notebook titles using the edit frontmatter feature in Pluto. This allows for a more personalized navigation experience, with the sidebar updating automatically upon the next export.
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
**Homepage Priority**: The index.jl notebook is given special treatment. Despite any custom title, it always appears first in the sidebar, ensuring that the homepage is easily accessible and prominently positioned.
"""

# ╔═╡ 6ca67d2c-7809-4026-aabb-e2e38465210d
index_url = "https://github.com/Dale-Black/GlassDocs/blob/master/assets/index.jpeg?raw=true";

# ╔═╡ 69201461-d1ee-4e4d-b17e-459508748967
Resource(index_url)

# ╔═╡ e3b98336-7c90-4a5c-a09c-b3d6297506e3
md"""
## 2. Advanced Meta-Docs Navigation

**Structured Sidebar with structure.json**: The second level introduces the `structure.json` file, a powerful tool for creating a custom sidebar. This feature is particularly useful when integrating documentation from multiple repositories.

- **Git Submodules**: Utilize git submodules to include content from different repositories, maintaining their individual commit histories. This is ideal for comprehensive documentation systems.

- **Sidebar Customization**: The structure.json file allows detailed organization, offering a layout that goes beyond the default indexing. Users can define specific structures for their sidebar, including nested folders and links to notebooks within git submodules.

- **Implementation Guide**: To implement, create a `structure.json` file at your repository's root, follow the example format to set up your sidebar, and reference the paths to notebooks and submodules relative to your main repository's root.

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

**Implementing `structure.json`**

To utilize this feature:

1. Create a `structure.json` file at the root of your Glass Notebook repository.
2. Follow the example format to define your sidebar structure.
3. Add external repositories as git submodules.
4. Reference the path to notebooks and submodules relative to the root of your main repository.

This custom sidebar structure enhances the navigation experience for users exploring your documentation on Glass Notebook.
"""


# ╔═╡ 039a9c77-fed4-45b5-a8cc-cec13224ddb2
md"""
## 3. Integrated Navigation Across Nested Meta-Docs

**Unified Interface with `navbar.json` (Coming Soon)**: The upcoming third level will enable the integration of multiple meta-docs into a unified navigation interface. By using a `navbar.json` file, users will be able to seamlessly link various meta-docs, enhancing the interconnectedness and accessibility of complex documentation systems.

**Enhanced Interconnectivity**: This feature aims to provide a smooth and cohesive navigation experience across a wide range of documentation, making it easier for users to find and access the information they need.
"""

# ╔═╡ 9d6f53ab-a45b-48c6-869f-7cea77d69469
md"""
# Other Features
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

# ╔═╡ 1de7c073-36d0-4f29-80d8-5c56d0cbf23f
md"""
## Links

Links work inside markdown like normal and relative links (e.g. `[link to other notebook](/docs/other_notebook.jl)`) will be automatically parsed and linked properly in Glass
"""

# ╔═╡ Cell order:
# ╠═46581809-1673-45c7-8cc1-40bf12b2a8d7
# ╠═463236e3-f8e0-4748-bbfc-4a4331c61ea6
# ╠═f4914413-531e-408f-85bc-87448e9c2987
# ╟─86c5a306-58d2-49e8-bed8-028ad8212a8a
# ╟─a5ee549f-f9d8-4078-8808-c1f267d3d779
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
# ╟─e3b98336-7c90-4a5c-a09c-b3d6297506e3
# ╟─039a9c77-fed4-45b5-a8cc-cec13224ddb2
# ╟─9d6f53ab-a45b-48c6-869f-7cea77d69469
# ╟─d3942b60-f85a-439d-98f4-8f4da24b830a
# ╟─1de7c073-36d0-4f29-80d8-5c56d0cbf23f
