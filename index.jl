### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> title = "GlassDocs"
#> sidebar = "false"

using Markdown
using InteractiveUtils

# ╔═╡ d2127ac7-3e13-453f-9843-1d3e0c554b1e
# ╠═╡ show_logs = false
begin
	using Pkg; Pkg.activate(temp = true)
	Pkg.add(url = "https://github.com/Dale-Black/HTML.jl")
	Pkg.add("PlutoUI")

	using HTML: to_html, head, link, script, divv, h1, img, p, span, a, figure
	using PlutoUI
end

# ╔═╡ 60680bd6-23f3-4b22-b164-6c06c093fc7f
to_html(
    divv(
        head(
            link(:rel => "preconnect", :href => "https://fonts.googleapis.com"),
			link(:rel => "preconnect", :href => "https://fonts.gstatic.com", :crossorigin => ""),
			link(:href => "https://fonts.googleapis.com/css2?family=Alegreya+Sans:ital,wght@0,400;0,700;1,400&family=Vollkorn:ital,wght@0,400;0,700;1,400;1,700&display=swap", :rel => "stylesheet"),
			link(:href => "https://cdn.jsdelivr.net/npm/daisyui@3.7.4/dist/full.css", :rel => "stylesheet", :type => "text/css"),
            script(:src => "https://cdn.tailwindcss.com")
        ),
        divv(:data_theme => "pastel", :class => "bg-transparent dark:bg-[#1f1f1f]",
			divv(:class => "flex justify-center items-center",
				divv(:class => "card card-bordered border-primary text-center w-full dark:text-[#e6e6e6]",
					divv(:class => "card-body flex flex-col justify-center items-center",
						img(:src => "https://github.com/Dale-Black/GlassDocs/blob/master/images/icon-512x512.png?raw=true", :class => "h-10 w-full md:h-32 md:w-32", :alt => "Glass Logo"),
						divv(:class => "text-5xl font-bold bg-gradient-to-r from-accent to-primary inline-block text-transparent bg-clip-text py-10", "Glass Docs"),
						p(:class => "card-text text-md font-serif", "Publish, interactive Pluto.jl notebooks with one click"
						)
                    )
                )
            )
        )
    )
)


# ╔═╡ 7d93c867-6122-422b-8f95-efd6fab82b04
md"""
## Tutorials
"""

# ╔═╡ a496823a-1a54-4748-8d12-5607a3a71ef0
md"""
## Package Development
"""

# ╔═╡ 703818e8-3198-41e4-b3aa-febd834fdad8
md"""
## Real-World Examples
"""

# ╔═╡ d6bd6300-5b14-4ab4-b519-ed59b466adb9
md"""
# Appendix
"""

# ╔═╡ e6c24576-9dec-4daf-8606-66b646318bb8
TableOfContents()

# ╔═╡ 56badbe6-b2e6-49f2-9cc6-5584f16dda86
struct Article
	title::String
	path::String
	image_url::String
end

# ╔═╡ 13051266-2434-4153-9742-59baa70a3af3
article_list_tutorials = Article[
	Article("Getting Started", "getting_started.jl", "https://images.unsplash.com/photo-1513542789411-b6a5d4f31634?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80"),
	Article("API", "api.jl", "https://images.unsplash.com/photo-1503789146722-cf137a3c0fea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2562&q=80"),
];

# ╔═╡ daed8bb3-4801-4016-ae8c-f66043dcd41b
article_list_packages = Article[
	Article("Building Docs", "getting_started.jl", "https://images.unsplash.com/photo-1513542789411-b6a5d4f31634?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80"),
	Article("API", "api.jl", "https://images.unsplash.com/photo-1503789146722-cf137a3c0fea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2562&q=80"),
];

# ╔═╡ d0918768-3986-41f9-9bf3-6871ec38786b
article_list_examples = Article[
	Article("Brain Dancer GUI", "getting_started.jl", "https://images.unsplash.com/photo-1513542789411-b6a5d4f31634?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80"),
	Article("CalciumScoring.jl Docs", "api.jl", "https://images.unsplash.com/photo-1503789146722-cf137a3c0fea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2562&q=80"),
];

# ╔═╡ 3f506b79-a486-45a0-b5b2-d1066efc9378
function article_card(article::Article, color::String)
	a(:href => article.path,
		divv(:data_theme => "pastel", :class => "bg-transparent dark:bg-[#1f1f1f]",
			divv(:class => "flex justify-center items-center",
				divv(:class => "card card-bordered border-$color text-center w-full dark:text-[#e6e6e6]",
					divv(:class => "card-body flex flex-col justify-center items-center",
						p(:class => "card-title", article.title),
						p("Click to open the notebook")
					),
					figure(
						img(:src => article.image_url, :alt => article.title)
					)
				)
			)
		)
	)
end

# ╔═╡ 113c5ddf-00c4-4fab-bd22-85ab1fd72ba7
to_html(
	divv(:class => "grid grid-cols-2 gap-4",
		[article_card(article, "accent") for article in article_list_tutorials]...
	)
)

# ╔═╡ 0ad110dc-5784-43d9-8baf-c334870abadd
to_html(
	divv(:class => "grid grid-cols-2 gap-4",
		[article_card(article, "secondary") for article in article_list_packages]...
	)
)

# ╔═╡ 3d3caa2e-70e2-41d7-973f-95a9082ea59e
to_html(
	divv(:class => "grid grid-cols-2 gap-4",
		[article_card(article, "primary") for article in article_list_packages]...
	)
)

# ╔═╡ Cell order:
# ╟─60680bd6-23f3-4b22-b164-6c06c093fc7f
# ╟─7d93c867-6122-422b-8f95-efd6fab82b04
# ╟─113c5ddf-00c4-4fab-bd22-85ab1fd72ba7
# ╟─a496823a-1a54-4748-8d12-5607a3a71ef0
# ╟─0ad110dc-5784-43d9-8baf-c334870abadd
# ╟─703818e8-3198-41e4-b3aa-febd834fdad8
# ╟─3d3caa2e-70e2-41d7-973f-95a9082ea59e
# ╟─d6bd6300-5b14-4ab4-b519-ed59b466adb9
# ╠═d2127ac7-3e13-453f-9843-1d3e0c554b1e
# ╠═e6c24576-9dec-4daf-8606-66b646318bb8
# ╠═56badbe6-b2e6-49f2-9cc6-5584f16dda86
# ╠═13051266-2434-4153-9742-59baa70a3af3
# ╠═daed8bb3-4801-4016-ae8c-f66043dcd41b
# ╠═d0918768-3986-41f9-9bf3-6871ec38786b
# ╠═3f506b79-a486-45a0-b5b2-d1066efc9378
