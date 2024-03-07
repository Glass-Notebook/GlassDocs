### A Pluto.jl notebook ###
# v0.19.40

#> [frontmatter]
#> title = "Getting Started"
#> category = "Tutorials"

using Markdown
using InteractiveUtils

# ╔═╡ e7d4da2c-a413-41a4-b72b-b9f5d414a177
# ╠═╡ show_logs = false
using Pkg; Pkg.activate("."); Pkg.instantiate()

# ╔═╡ f1f67e1f-9608-4465-a771-ef742ee7e648
using PlutoUI

# ╔═╡ 7d73a5fc-b9e9-4d04-90ec-e57f19eddf38
TableOfContents()

# ╔═╡ b27b33dc-fb83-4cfb-b57c-8110cba62f60
md"""
# Getting Started

[Glass Notebook](https://glassnotebook.io/) is a powerful platform that simplifies the process of publishing Pluto notebooks as interactive or static websites. With Glass Notebook, you can easily share your work with others, whether you're creating documentation, tutorials, or data-driven stories. In this guide, we'll walk you through the steps to get started with Glass Notebook.
"""

# ╔═╡ 687c7c2f-4006-4103-92bf-df2333917bd4
md"""
## 1. Sign In

To begin using Glass Notebook, you'll need to sign in with your GitHub account. Follow these steps:

1. Go to `https://glassnotebook.io/`
2. Click on the "Get Started" button in the upper right-hand corner
3. Click on the "Sign in with GitHub" button
4. Authorize Glass Notebook to access your GitHub account

![Glass Notebook Homepage](https://github.com/Dale-Black/GlassDocs/blob/master/assets/homepage.jpeg?raw=true)

![Sign in with GitHub](https://github.com/Dale-Black/GlassDocs/blob/master/assets/githubsignin.jpeg?raw=true)

![Authorize Glass Notebook](https://github.com/Dale-Black/GlassDocs/blob/master/assets/authgithub.jpeg?raw=true)
"""

# ╔═╡ d3039dfe-53f3-45c6-bc0f-9cbb42290cbd
md"""

## 2. Link Repository

After signing in, you'll need to link a GitHub repository containing your Pluto notebooks. A repository is a folder that contains all the files and folders related to your project. To link a repository:

1. Click on the "Add Notebook" button
2. Paste your GitHub repository URL or select a repository directly through GitHub
3. Choose the privacy setting for your linked repository (private or public)
4. Toggle the cloud icon next to each notebook to make it interactive or static

![Add Notebook](https://github.com/Dale-Black/GlassDocs/blob/master/assets/addnotebook.jpeg?raw=true)

![Toggle Privacy](https://github.com/Dale-Black/GlassDocs/blob/master/assets/toggleprivate.jpeg?raw=true)

![Toggle Interactivity](https://github.com/Dale-Black/GlassDocs/blob/master/assets/toggleinteractive.jpeg?raw=true)
"""

# ╔═╡ 0c260417-4386-483d-bcd4-8751126e38dd
md"""
## 3. Share Notebook(s)

Once you've linked your repository and configured your notebooks, you can easily share them with others. To share a notebook:

1. Navigate to the notebook you want to share
2. Right-click on the notebook URL
3. Select "Copy Link" or "Copy Link Address" (depending on your browser)
4. Share the copied link with others via email, chat, or any other preferred method

You can also add a markdown badge to your repository's README file to provide a quick link to your Glass Notebook documentation. To get the badge URL:

1. Navigate to your notebook on Glass Notebook
2. Click on the "Share" button
3. Copy the markdown badge code provided
4. Paste the code into your repository's README file

[![Glass Notebook](https://img.shields.io/badge/Docs-Glass%20Notebook-aquamarine.svg)](https://glassnotebook.io/r/fPuxqzHi6mmOvzXwVNxuK/index.jl)

## Next Steps

Congratulations! You're now ready to start using Glass Notebook to create and share interactive notebooks. Here are some additional resources to help you get the most out of the platform:

- [Advanced Usage](02_advanced_usage.jl): Learn about customizing your notebooks and using advanced features
- [Community Zulip Forum](https://julialang.zulipchat.com/#narrow/stream/428178-glassnotebook): Connect with other Glass Notebook users, ask questions, and share your projects
- [Contact Support](mailto:support@glassnotebook.io): If you need further assistance, don't hesitate to reach out to our support team
"""

# ╔═╡ Cell order:
# ╠═e7d4da2c-a413-41a4-b72b-b9f5d414a177
# ╠═f1f67e1f-9608-4465-a771-ef742ee7e648
# ╠═7d73a5fc-b9e9-4d04-90ec-e57f19eddf38
# ╟─b27b33dc-fb83-4cfb-b57c-8110cba62f60
# ╟─687c7c2f-4006-4103-92bf-df2333917bd4
# ╟─d3039dfe-53f3-45c6-bc0f-9cbb42290cbd
# ╟─0c260417-4386-483d-bcd4-8751126e38dd
