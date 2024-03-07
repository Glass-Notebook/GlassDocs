### A Pluto.jl notebook ###
# v0.19.40

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

# ╔═╡ b6c2921f-46a3-4713-8cb3-551919fd4d3a
html"""
<h1>Advanced Usage</h1>

<p><a href="https://glassnotebook.io/">Glass Notebook</a> offers a versatile platform for publishing Pluto notebooks as interactive or static websites. It caters to a wide range of users, from those seeking simple documentation to advanced users who require interactive features and real-time data handling. Below, we explore the various customizations and export options available in Glass Notebook, designed to enhance user experience and meet diverse needs.</p>

<details>
<summary><h2>Notebook Export Options</h2></summary>

<p>Understanding the export options in Glass Notebook is key to utilizing its full potential. Users can choose from different notebook types depending on their requirements for interactivity and data handling. Here's an overview of the available options:</p>

<table>
  <thead>
    <tr>
      <th>Notebook Type</th>
      <th>Interactivity Level</th>
      <th>Data Injection Capability</th>
      <th>Relative Cost</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Static Notebooks</td>
      <td>None</td>
      <td>No</td>
      <td>Lowest</td>
    </tr>
    <tr>
      <td>Precomputed Notebooks</td>
      <td>Interactive UIs</td>
      <td>No</td>
      <td>Medium</td>
    </tr>
    <tr>
      <td>Fully Interactive</td>
      <td>Full</td>
      <td>Yes (e.g., data uploads)</td>
      <td>Highest</td>
    </tr>
  </tbody>
</table>

<details>
<summary>Static Notebooks</summary>
<p>Ideal for basic viewing needs, these notebooks offer no interactivity or data injection but come at the lowest cost.</p>
</details>

<details>
<summary>Precomputed Notebooks</summary>
<p>These provide interactive user interfaces without real-time data capabilities, striking a balance between interactivity and cost.</p>
</details>

<details>
<summary>Fully Interactive Notebooks</summary>
<p>For the most advanced usage, these notebooks offer full interactivity with real-time data handling capabilities, such as data uploads, making them suitable for complex applications.</p>
</details>

<p>This section aims to guide users in selecting the right type of notebook export to match their specific project requirements, ensuring efficient and effective use of Glass Notebook's features.</p>

</details>

<!-- Rest of the content goes here -->

"""

# ╔═╡ 909ea835-6307-409a-8a00-544c6d9619be
html"""
<h1>Layout Options</h1>

<p>Glass Notebook provides several layout options to structure and organize your documentation effectively:</p>

<ol>
  <li><strong>Automatic Sidebar Layout</strong>: Glass Notebook generates a sidebar automatically based on your Pluto notebook names and structure.</li>
  <li><strong>Nested Project Layout</strong>: Customize the sidebar using a <code>structure.json</code> file to include notebooks from multiple packages or projects.</li>
  <li><strong>Hyper-Nested Layout (Coming Soon)</strong>: Combine multiple nested projects into a single interface using a <code>navbar.json</code> file.</li>
</ol>

<details>
<summary><h2>1. Automatic Sidebar Layout</h2></summary>

<p>The Automatic Sidebar Layout is the simplest option, requiring no additional setup. Glass Notebook creates a sidebar based on your Pluto notebook names and their directory structure.</p>

<details>
<summary>Key Features</summary>
<ul>
  <li>No manual configuration needed</li>
  <li>Automatically updates as you add, remove, or rename notebooks</li>
  <li>Notebook titles can be customized using Pluto's frontmatter</li>
</ul>
</details>

<details>
<summary>Customizing Notebook Titles</summary>
<ol>
  <li>Open the notebook in Pluto</li>
  <li>Click on the "Edit Frontmatter" button</li>
  <li>Modify the notebook title in the frontmatter</li>
  <li>Save the changes</li>
</ol>
<p>The sidebar will update automatically with the new title when you export your project.</p>
<img src="https://github.com/Dale-Black/GlassDocs/blob/master/assets/savepluto.jpeg?raw=true" alt="Save Pluto Notebook" />
<hr />
<img src="https://github.com/Dale-Black/GlassDocs/blob/master/assets/editfrontmatter.jpeg?raw=true" alt="Edit Frontmatter" />
<hr />
<img src="https://github.com/Dale-Black/GlassDocs/blob/master/assets/frontmatter.jpeg?raw=true" alt="Frontmatter" />
</details>

<p><strong>Homepage Priority</strong>: The <code>index.jl</code> notebook always appears first in the sidebar, ensuring easy access to the homepage.</p>
<img src="https://github.com/Dale-Black/GlassDocs/blob/master/assets/index.jpeg?raw=true" alt="Index Notebook" />

</details>

<details>
<summary><h2>2. Nested Project Layout</h2></summary>

<p>The Nested Project Layout allows you to create a custom sidebar that includes notebooks from multiple packages, projects, or tutorials. By using a <code>structure.json</code> file, you can define a hierarchical structure that seamlessly integrates notebooks from different sources into a single, cohesive documentation project.</p>

<details>
<summary>Key Features</summary>
<ul>
  <li>Include notebooks from multiple packages or projects</li>
  <li>Create a unified structure with folders and subfolders</li>
  <li>Automatically incorporate updates from linked packages or projects</li>
</ul>
</details>

<details>
<summary>Implementing a Nested Project Layout</summary>
<ol>
  <li>Create a <code>structure.json</code> file in your main project's root directory</li>
  <li>Define your desired sidebar structure using the provided JSON format</li>
  <li>Specify the paths to notebooks from different packages or projects</li>
  <li>Use Git submodules to include the linked packages or projects</li>
  <li>Export your main project, and the nested sidebar will be generated</li>
</ol>
<pre><code>
{
  "sidebar": {
    "title": "My Nested Project",
    "elements": [
      {
        "type": "notebook",
        "path": "index.jl",
        "title": "Home"
      },
      {
        "type": "folder",
        "title": "Package A",
        "defaultOpened": true,
        "elements": [
          {
            "type": "notebook",
            "path": "packages/PackageA/tutorials/getting_started.jl",
            "title": "Package A: Getting Started"
          },
          {
            "type": "notebook",
            "path": "packages/PackageA/examples/advanced_usage.jl",
            "title": "Package A: Advanced Usage"
          }
        ]
      },
      {
        "type": "folder",
        "title": "Package B",
        "defaultOpened": false,
        "elements": [
          {
            "type": "notebook",
            "path": "packages/PackageB/introduction.jl",
            "title": "Package B: Introduction"
          }
        ]
      }
    ]
  }
}
</code></pre>
</details>

</details>

<details>
<summary><h2>3. Hyper-Nested Layout (Coming Soon)</h2></summary>

<p>The Hyper-Nested Layout is an upcoming feature that will allow you to combine multiple nested projects into a single, unified interface. With this layout option, you can create a top-level navigation bar using a <code>navbar.json</code> file, enabling users to easily switch between different nested projects.</p>

<p>This feature will be particularly useful for creating comprehensive documentation that covers multiple domains or large-scale projects consisting of several nested projects.</p>

<details>
<summary>Key Benefits</summary>
<ul>
  <li>Combine multiple nested projects seamlessly</li>
  <li>Provide a top-level navigation bar for easy access to different projects</li>
  <li>Create a unified and intuitive documentation experience for users</li>
</ul>
</details>

<p>Stay tuned for more information on this powerful new feature!</p>

</details>
"""

# ╔═╡ d3a7a334-0f96-491e-9512-ea1d3b6cca21
md"""
# Other Features

## Glass Ignore Export (`.glassignore`)

Glass Notebook automatically indexes every Pluto notebook contained within a GitHub repository. These notebooks will then be exported by Glass. If certain notebooks are not meant for export, they can be included in a `.glassignore` file. This file will tell Glass to ignore any notebooks in the repository that match the string given - which follows the same regex rules as `.gitignore` on GitHub.

For example, say you want to ignore the notebook located at the path `Repository.jl/test/expensive_notebook.jl`. Any of the following entries in the `.glassignore` file would successfully tell Glass Notebook to avoid the `expensive_notebook.jl` when exporting:

```bash
# example .glassignore file:

**expensive_notebook.jl
Repository.jl/test/expensive_notebook.jl
# etc...
```

## Links
Links work inside Glass Notebook just like they do in regular Markdown. Relative links (e.g., [link to other notebook]()) will be automatically parsed and linked properly in Glass.

You can use links to:

- Link to other notebooks within the same project
- Link to notebooks in different nested projects
- Link to external websites or resources

Glass Notebook will handle the proper resolution of these links, ensuring that users can easily navigate between notebooks and access external resources.
"""

# ╔═╡ Cell order:
# ╠═46581809-1673-45c7-8cc1-40bf12b2a8d7
# ╠═463236e3-f8e0-4748-bbfc-4a4331c61ea6
# ╠═f4914413-531e-408f-85bc-87448e9c2987
# ╟─b6c2921f-46a3-4713-8cb3-551919fd4d3a
# ╟─909ea835-6307-409a-8a00-544c6d9619be
# ╟─d3a7a334-0f96-491e-9512-ea1d3b6cca21
