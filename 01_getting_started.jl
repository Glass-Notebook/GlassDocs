### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> title = "Getting Started"
#> category = "Tutorials"

using Markdown
using InteractiveUtils

# ╔═╡ f8b4d8a6-e7c3-4e93-96b6-8ae988fb79f6
# ╠═╡ show_logs = false
begin
	using Pkg
	Pkg.activate(".")
	Pkg.instantiate()

	using PlutoUI
	using HTMLStrings: script, to_html, img
end

# ╔═╡ 7d73a5fc-b9e9-4d04-90ec-e57f19eddf38
TableOfContents()

# ╔═╡ 93828e96-dda7-42a8-9524-c1fdc098a321
to_html(script(:src => "https://cdn.tailwindcss.com"))

# ╔═╡ 4b5d4dfc-63af-11ee-096f-3f68748d168f
md"""
# Getting Started

[Glass Notebook](https://glassnotebook.io/) makes publishing Pluto notebooks simple. Just (1) sign in with your GitHub account, (2) link your repository, and (3) share your notebook(s)
"""

# ╔═╡ ceb890af-3537-4286-8734-5309b0d11648
md"""
## 1. Sign In
"""

# ╔═╡ f830e89e-4c8d-4477-a827-ff894bd9f0e4
md"""
Type in `https://glassnotebook.io/` and click "Get Started" in the upper right hand corner.
"""

# ╔═╡ 8dc6060f-6112-49f1-9856-c3e971cc5a7f
to_html(
	img(
		:class => "w-full rounded-md pb-2",
		:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/homepage.png?raw=true"
	),
)

# ╔═╡ ef9912d7-4336-4f5f-bb59-a4e46bedf77f
md"""
Click sign in with GitHub, then authorize Glass Notebook to your GitHub account
"""

# ╔═╡ ef54e0f4-b8d9-4782-b267-80f90d40d97b
to_html(
	img(
		:class => "w-full rounded-md pb-2",
		:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/authgithub.png?raw=true"
	),
)

# ╔═╡ a1284a2c-977e-4df5-aa0e-ba5651b62fe6
md"""
## 2. Link Repository
"""

# ╔═╡ 3ee24a14-4343-4c86-b7eb-3f82b2368355
md"""
Add repository by pasting the GitHub URL or directly through GitHub.
"""

# ╔═╡ 4f7fe12a-9497-4e4b-85d0-c0505f4a1c09
to_html(
	img(
		:class => "w-full rounded-md pb-2",
		:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/addnotebook.png?raw=true"
	),
)

# ╔═╡ e01f0a53-228f-4359-b8f3-1b5b2f09c412
md"""
Choose `private` or `pubic` option for linked repositories
"""

# ╔═╡ 67737d20-5f67-4ac3-83c8-66bd8c636c56
to_html(
	img(
		:class => "w-full rounded-md pb-2",
		:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/toggleprivate.png?raw=true"
	),
)

# ╔═╡ 381bb5c1-de79-47d1-bc59-2f663e6e7cf6
md"""
Choose whether or not to make notebooks interactive by toggling the cloud near the side of the individual notebook
"""

# ╔═╡ 42c366a9-cdb1-44e2-a1bc-80345ff6d0cd
to_html(
	img(
		:class => "w-full rounded-md pb-2",
		:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/toggleinteractive.png?raw=true"
	),
)

# ╔═╡ f2817881-2427-41b5-925c-86a88fcae4d7
md"""
## 3. Share Notebook(s)
"""

# ╔═╡ 02868e2f-f6a7-4e53-ae14-93cf2b932b88
md"""
Copy and paste the notebook URL to share with others

*Note*: we have a simple markdown badge for any documentation built with Glass

[![Glass Notebook](https://img.shields.io/badge/Docs-Glass%20Notebook-aquamarine.svg)](https://glassnotebook.io/r/zn0Xr-A1cYegYHSDJzSyO/docs/index.jl)
"""

# ╔═╡ a7e8bfae-fc0b-41c2-9576-bcfdc7c8b03c
to_html(
	img(
		:class => "w-full rounded-md pb-2",
		:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/sharenotebook.png?raw=true"
	),
)

# ╔═╡ Cell order:
# ╟─4b5d4dfc-63af-11ee-096f-3f68748d168f
# ╟─ceb890af-3537-4286-8734-5309b0d11648
# ╟─f830e89e-4c8d-4477-a827-ff894bd9f0e4
# ╟─8dc6060f-6112-49f1-9856-c3e971cc5a7f
# ╟─ef9912d7-4336-4f5f-bb59-a4e46bedf77f
# ╟─ef54e0f4-b8d9-4782-b267-80f90d40d97b
# ╟─a1284a2c-977e-4df5-aa0e-ba5651b62fe6
# ╟─3ee24a14-4343-4c86-b7eb-3f82b2368355
# ╟─4f7fe12a-9497-4e4b-85d0-c0505f4a1c09
# ╟─e01f0a53-228f-4359-b8f3-1b5b2f09c412
# ╟─67737d20-5f67-4ac3-83c8-66bd8c636c56
# ╟─381bb5c1-de79-47d1-bc59-2f663e6e7cf6
# ╟─42c366a9-cdb1-44e2-a1bc-80345ff6d0cd
# ╟─f2817881-2427-41b5-925c-86a88fcae4d7
# ╟─02868e2f-f6a7-4e53-ae14-93cf2b932b88
# ╟─a7e8bfae-fc0b-41c2-9576-bcfdc7c8b03c
# ╟─f8b4d8a6-e7c3-4e93-96b6-8ae988fb79f6
# ╟─7d73a5fc-b9e9-4d04-90ec-e57f19eddf38
# ╟─93828e96-dda7-42a8-9524-c1fdc098a321
