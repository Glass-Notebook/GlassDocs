### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> title = "Package Documentation"
#> category = "Templates"

using Markdown
using InteractiveUtils

# ╔═╡ 9a570c64-aff3-4d4e-83e7-d626f032e220
# ╠═╡ show_logs = false
begin
	using Pkg
	Pkg.activate(joinpath(pwd(), "docs"))
	Pkg.instantiate()

	using HTMLStrings: to_html, head, link, script, divv, h1, img, p, span, a, figure, hr
	using PlutoUI
end

# ╔═╡ 009397d1-d79c-4f6c-b901-b38af15c1df5
md"""
## Tutorials
"""

# ╔═╡ 7c971cf5-a689-4931-98d2-5502f97ffca1
md"""
## API
"""

# ╔═╡ 5e33899d-44ce-4143-8896-76c6ebef2f92
to_html(hr())

# ╔═╡ b794083f-79c0-42ac-aacc-749f5b1c28e3
TableOfContents()

# ╔═╡ 178130a9-5543-4d69-9144-413c76ed2f76
data_theme = "dracula";

# ╔═╡ a48f466d-40cb-4702-a67d-90282e5fa263
function index_title_card(title::String, subtitle::String, image_url::String; data_theme::String = "pastel", border_color::String = "primary")
	return to_html(
	    divv(
	        head(
				link(:href => "https://cdn.jsdelivr.net/npm/daisyui@3.7.4/dist/full.css", :rel => "stylesheet", :type => "text/css"),
	            script(:src => "https://cdn.tailwindcss.com")
	        ),
			divv(:data_theme => "$data_theme", :class => "card card-bordered flex justify-center items-center border-$border_color text-center w-full dark:text-[#e6e6e6]",
				divv(:class => "card-body flex flex-col justify-center items-center",
					img(:src => "$image_url", :class => "h-20 w-20 md:h-32 md:w-32 rounded-md", :alt => "$title Logo"),
					divv(:class => "text-5xl font-bold bg-gradient-to-r from-accent to-primary inline-block text-transparent bg-clip-text py-10", "$title"),
					p(:class => "card-text text-md font-serif", "$subtitle"
					)
				)
			)
	    )
	)
end;

# ╔═╡ dc6d22c2-75bb-4b3f-9a43-b5df1b541423
index_title_card(
	"ExamplePackage.jl",
	"Example Package Template with Documentation from Glass Notebook",
	"https://img.freepik.com/free-photo/colorful-bar-graph-sits-table-with-dark-background_1340-34474.jpg";
	data_theme = data_theme
)

# ╔═╡ ad7c0b46-7638-4116-8734-da992d5d1671
struct Article
	title::String
	path::String
	image_url::String
end

# ╔═╡ c5d859f8-2c6a-4010-9a92-f34a0ee5ca80
article_list_tutorials = Article[
	Article("Getting Started", "docs/getting_started.jl", "https://img.freepik.com/free-photo/futuristic-spaceship-takes-off-into-purple-galaxy-fueled-by-innovation-generated-by-ai_24640-100023.jpg"),
	Article("Advanced Usage", "docs/advanced_usage.jl", "https://img.freepik.com/free-photo/vibrant-colors-flow-liquid-wave-pattern-generated-by-ai_188544-39060.jpg"),
];

# ╔═╡ 9b3b57c9-637e-4728-b271-9001d32e1d99
article_list_api = Article[
	Article("API", "docs/api.jl", "https://img.freepik.com/free-photo/modern-technology-workshop-creativity-innovation-communication-development-generated-by-ai_188544-24548.jpg"),
];

# ╔═╡ f69d95e9-3d8f-48f8-97f5-deef81f6e92d
function article_card(article::Article, color::String; data_theme = "pastel")
    a(:href => article.path, :class => "w-1/2 p-2",
		divv(:data_theme => "$data_theme", :class => "card card-bordered border-$color text-center dark:text-[#e6e6e6]",
			divv(:class => "card-body justify-center items-center",
				p(:class => "card-title", article.title),
				p("Click to open the notebook")
			),
			figure(
				img(:src => article.image_url, :alt => article.title)
			)
        )
    )
end;

# ╔═╡ 68bab306-bf1d-4586-8225-af4fc714b59c
to_html(
    divv(:class => "flex flex-wrap justify-center items-start",
        [article_card(article, "accent"; data_theme = data_theme) for article in article_list_tutorials]...
    )
)

# ╔═╡ 2289baf6-e7ad-45a3-8d20-f13b68f9f1b8
to_html(
    divv(:class => "flex flex-wrap justify-center items-start",
        [article_card(article, "secondary"; data_theme = data_theme) for article in article_list_api]...
    )
)

# ╔═╡ Cell order:
# ╟─dc6d22c2-75bb-4b3f-9a43-b5df1b541423
# ╟─009397d1-d79c-4f6c-b901-b38af15c1df5
# ╟─68bab306-bf1d-4586-8225-af4fc714b59c
# ╟─7c971cf5-a689-4931-98d2-5502f97ffca1
# ╟─2289baf6-e7ad-45a3-8d20-f13b68f9f1b8
# ╟─5e33899d-44ce-4143-8896-76c6ebef2f92
# ╠═9a570c64-aff3-4d4e-83e7-d626f032e220
# ╠═b794083f-79c0-42ac-aacc-749f5b1c28e3
# ╠═178130a9-5543-4d69-9144-413c76ed2f76
# ╠═a48f466d-40cb-4702-a67d-90282e5fa263
# ╠═ad7c0b46-7638-4116-8734-da992d5d1671
# ╠═c5d859f8-2c6a-4010-9a92-f34a0ee5ca80
# ╠═9b3b57c9-637e-4728-b271-9001d32e1d99
# ╠═f69d95e9-3d8f-48f8-97f5-deef81f6e92d
