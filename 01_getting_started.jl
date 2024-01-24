### A Pluto.jl notebook ###
# v0.19.36

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

# ╔═╡ b16e39b3-1074-4fdf-b5cb-0f5a30376015
homepage_url = "https://github.com/Dale-Black/GlassDocs/blob/master/images/homepage.jpeg?raw=true"

# ╔═╡ a779fcd4-c413-4eea-aa36-04b20791bfce
Resource(homepage_url)

# ╔═╡ ef9912d7-4336-4f5f-bb59-a4e46bedf77f
md"""
Click sign in with GitHub, then authorize Glass Notebook to your GitHub account
"""

# ╔═╡ afc4935c-ddd4-4509-bdcc-dfe90630f10b
auth_url = "https://github.com/Dale-Black/GlassDocs/blob/master/images/authgithub.jpeg?raw=true"

# ╔═╡ 96156999-ecec-48d7-9269-e64363f50734
Resource(auth_url)

# ╔═╡ a1284a2c-977e-4df5-aa0e-ba5651b62fe6
md"""
## 2. Link Repository
"""

# ╔═╡ 3ee24a14-4343-4c86-b7eb-3f82b2368355
md"""
Add repository by pasting the GitHub URL or directly through GitHub.
"""

# ╔═╡ 1edb0107-ad4f-4887-beba-1552928f3db3
add_notebook_url = "https://github.com/Dale-Black/GlassDocs/blob/master/images/addnotebook.jpeg?raw=true"

# ╔═╡ d0c2b22e-7e9a-4901-8d8d-23c3e3beeeb6
Resource(add_notebook_url)

# ╔═╡ e01f0a53-228f-4359-b8f3-1b5b2f09c412
md"""
Choose `private` or `pubic` option for linked repositories
"""

# ╔═╡ 814b5f54-9c0d-4f9f-9553-9837e7b1efc6
toggle_private_url = "https://github.com/Dale-Black/GlassDocs/blob/master/images/toggleprivate.jpeg?raw=true"

# ╔═╡ 967787cf-0b6f-43cf-a8ba-6501ea31485c
Resource(toggle_private_url)

# ╔═╡ 381bb5c1-de79-47d1-bc59-2f663e6e7cf6
md"""
Choose whether or not to make notebooks interactive by toggling the cloud near the side of the individual notebook
"""

# ╔═╡ 6a3fbcd3-d2bb-4eff-80ab-82a08b76b56f
toggle_interactive_url = "https://github.com/Dale-Black/GlassDocs/blob/master/images/toggleinteractive.png?raw=true"

# ╔═╡ ead0836b-0717-4c1f-b264-4006744a3de9
Resource(toggle_private_url)

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

# ╔═╡ a67319b6-4fee-4269-95df-4ddf6137347d
share_notebook_url = "https://github.com/Dale-Black/GlassDocs/blob/master/images/sharenotebook.png?raw=true"

# ╔═╡ f7a1d5ee-c057-4779-9b42-d1e3563e57d6
Resource(share_notebook_url)

# ╔═╡ f1fdb759-b4fb-4c0e-94a7-cd57d380e1ae


# ╔═╡ Cell order:
# ╠═e7d4da2c-a413-41a4-b72b-b9f5d414a177
# ╠═f1f67e1f-9608-4465-a771-ef742ee7e648
# ╠═7d73a5fc-b9e9-4d04-90ec-e57f19eddf38
# ╟─4b5d4dfc-63af-11ee-096f-3f68748d168f
# ╟─ceb890af-3537-4286-8734-5309b0d11648
# ╟─f830e89e-4c8d-4477-a827-ff894bd9f0e4
# ╠═b16e39b3-1074-4fdf-b5cb-0f5a30376015
# ╠═a779fcd4-c413-4eea-aa36-04b20791bfce
# ╟─ef9912d7-4336-4f5f-bb59-a4e46bedf77f
# ╠═afc4935c-ddd4-4509-bdcc-dfe90630f10b
# ╠═96156999-ecec-48d7-9269-e64363f50734
# ╟─a1284a2c-977e-4df5-aa0e-ba5651b62fe6
# ╟─3ee24a14-4343-4c86-b7eb-3f82b2368355
# ╠═1edb0107-ad4f-4887-beba-1552928f3db3
# ╠═d0c2b22e-7e9a-4901-8d8d-23c3e3beeeb6
# ╟─e01f0a53-228f-4359-b8f3-1b5b2f09c412
# ╠═814b5f54-9c0d-4f9f-9553-9837e7b1efc6
# ╠═967787cf-0b6f-43cf-a8ba-6501ea31485c
# ╟─381bb5c1-de79-47d1-bc59-2f663e6e7cf6
# ╠═6a3fbcd3-d2bb-4eff-80ab-82a08b76b56f
# ╠═ead0836b-0717-4c1f-b264-4006744a3de9
# ╟─f2817881-2427-41b5-925c-86a88fcae4d7
# ╟─02868e2f-f6a7-4e53-ae14-93cf2b932b88
# ╠═a67319b6-4fee-4269-95df-4ddf6137347d
# ╠═f7a1d5ee-c057-4779-9b42-d1e3563e57d6
# ╠═f1fdb759-b4fb-4c0e-94a7-cd57d380e1ae
