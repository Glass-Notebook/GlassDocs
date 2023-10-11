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
	using HTMLStrings
end

# ╔═╡ 7d73a5fc-b9e9-4d04-90ec-e57f19eddf38
TableOfContents()

# ╔═╡ 4b5d4dfc-63af-11ee-096f-3f68748d168f
md"""
# Getting Started

[Glass Notebook](https://glassnotebook.io/) makes publishing Pluto notebooks simple. Just (1) sign in with your GitHub account, (2) link your repository, and (3) share your notebook(s)
"""

# ╔═╡ ceb890af-3537-4286-8734-5309b0d11648
md"""
## 1. Sign In

a. Type in `https://glassnotebook.io/` and click "Get Started" in the upper right hand corner.

b. Click sign in with GitHub, then authorize Glass Notebook to your GitHub account
"""

# ╔═╡ 331bcbce-52b7-4f1f-b6a0-94a5e90eeb87
to_html(
	divv(
		head(
			script(:src => "https://cdn.tailwindcss.com")
		),
		divv(:class => "flex flex-wrap justify-center items-start gap-4",
			img(
				:class => "w-1/2 rounded-md",
				:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/homepage.png?raw=true"
			),
			img(
				:class => "w-1/2 rounded-md",
				:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/authgithub.png?raw=true"
			),
		)
	)
)

# ╔═╡ a1284a2c-977e-4df5-aa0e-ba5651b62fe6
md"""
## 2. Link Repository

a. Add repository by pasting the GitHub URL or directly through GitHub

b. Choose `private` or `pubic` option for linked repositories

c. Choose whether or not to make notebooks interactive by toggling the cloud near the side of the individual notebook
"""

# ╔═╡ 4543f920-bfc2-42cd-a689-66743ded5681
to_html(
	divv(
		head(
			script(:src => "https://cdn.tailwindcss.com")
		),
		divv(:class => "flex flex-wrap justify-center items-start gap-4",
			img(
				:class => "w-1/2 rounded-md",
				:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/addnotebook.png?raw=true"
			),
			img(
				:class => "w-1/2 rounded-md",
				:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/toggleprivate.png?raw=true"
			),
			img(
				:class => "w-1/2 rounded-md",
				:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/toggleinteractive.png?raw=true"
			),
		)
	)
)

# ╔═╡ f2817881-2427-41b5-925c-86a88fcae4d7
md"""
## 3. Share Notebook(s)

a. Copy and paste the notebook URL to share with others

*Note*: we have a simple markdown badge for any documentation built with Glass

[![Glass Notebook](https://img.shields.io/badge/Docs-Glass%20Notebook-aquamarine.svg)](https://glassnotebook.io/r/zn0Xr-A1cYegYHSDJzSyO/docs/index.jl)
"""

# ╔═╡ 550edfe8-dfa2-472d-9e40-d04355177243
to_html(
	divv(
		head(
			script(:src => "https://cdn.tailwindcss.com")
		),
		divv(:class => "flex flex-wrap justify-center items-start gap-4",
			img(
				:class => "w-1/2 rounded-md",
				:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/sharenotebook.png?raw=true"
			),
		)
	)
)

# ╔═╡ Cell order:
# ╠═f8b4d8a6-e7c3-4e93-96b6-8ae988fb79f6
# ╠═7d73a5fc-b9e9-4d04-90ec-e57f19eddf38
# ╟─4b5d4dfc-63af-11ee-096f-3f68748d168f
# ╟─ceb890af-3537-4286-8734-5309b0d11648
# ╠═331bcbce-52b7-4f1f-b6a0-94a5e90eeb87
# ╟─a1284a2c-977e-4df5-aa0e-ba5651b62fe6
# ╠═4543f920-bfc2-42cd-a689-66743ded5681
# ╟─f2817881-2427-41b5-925c-86a88fcae4d7
# ╠═550edfe8-dfa2-472d-9e40-d04355177243
