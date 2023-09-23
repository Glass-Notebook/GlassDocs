### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ f0f517a8-04ad-4c32-aaae-0b01535d4365
using HypertextLiteral

# ╔═╡ 6ae41541-e0e5-4a0a-b3ae-2c7cbe9d4c81
html"""
<head>
	<link href="https://cdn.jsdelivr.net/npm/daisyui@3.7.4/dist/full.css" rel="stylesheet" type="text/css" />
	<script src="https://cdn.tailwindcss.com"></script>
</head>
"""

# ╔═╡ 69108975-9e79-4b85-94f2-13557567ce34
html"""
<header class="navbar grid grid-cols-2 bg-transparent px-6 py-10 md:px-10">
  <a href="/" class="">
    <img
      src="images/full-logo.png"
      class="h-8 w-auto md:h-12 md:w-40"
      alt="Glass Logo"
    />
    <!-- For the small logo, you can replace 'images/small-logo.png' with the actual path -->
    <img
      src="images/icon-512x512.png"
      class="h-8 w-8 md:hidden"
      alt="Glass Logo"
    />
  </a>

  <div class="justify-self-end md:flex md:flex-row flex-col items-start">
    <span class="justify-self-end mr-5 text-neutral-100">
      Welcome to the Docs!
    </span>
  </div>

</header>
"""

# ╔═╡ f46cdb88-683b-4792-96d2-62e4b96e9d72
struct Article
	title::String
	path::String
	image_url::String
end

# ╔═╡ 85692c89-0d4e-44e6-a061-01174864b291
article_list = Article[
	Article("Time Series Analysis", "tutorials/time_series.jl", "https://images.unsplash.com/photo-1501139083538-0139583c060f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80"),
	Article("Neural Network Denoiser", "tutorials/denoiser.jl", "https://images.unsplash.com/photo-1545987796-200677ee1011?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80"),
];

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"

[compat]
HypertextLiteral = "~0.9.4"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "fc304fba520d81fb78ea25b98f5762b4591b1182"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.Tricks]]
git-tree-sha1 = "aadb748be58b492045b4f56166b5188aa63ce549"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.7"
"""

# ╔═╡ Cell order:
# ╠═f0f517a8-04ad-4c32-aaae-0b01535d4365
# ╠═6ae41541-e0e5-4a0a-b3ae-2c7cbe9d4c81
# ╠═69108975-9e79-4b85-94f2-13557567ce34
# ╠═f46cdb88-683b-4792-96d2-62e4b96e9d72
# ╠═85692c89-0d4e-44e6-a061-01174864b291
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
