### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> title = "GlassDocs"
#> sidebar = "false"

using Markdown
using InteractiveUtils

# ╔═╡ d871cef8-5f6d-4279-8949-616b6ca76396
# ╠═╡ show_logs = false
begin
	using Pkg
	Pkg.activate(".")
	Pkg.instantiate()

	using HTMLStrings: to_html, head, link, script, divv, h1, img, p, span, a, figure, hr
	using PlutoUI
end

# ╔═╡ ba9e26af-94fc-47e0-9dfe-03fd0468c0c7
md"""
## Tutorials
"""

# ╔═╡ 6cb7945c-6e2d-46fd-bf1c-fa51971645bd
md"""
## Templates
"""

# ╔═╡ 5a5af88e-b35d-4660-90e9-60a864ae77bb
md"""
## Real-World Examples
"""

# ╔═╡ 546b7906-c112-4225-aa81-e7138ae352cb
to_html(
	divv(
		p(:class => "h-20"),
		hr()
	)
)

# ╔═╡ d6bd6300-5b14-4ab4-b519-ed59b466adb9
md"""
#### Appendix

Note that the cells used to create this homepage are hidden below. Go to GitHub to view the cells, or even better, look at the [tempates](https://glassnotebook.io/) folder to start creating your own homepage.
"""

# ╔═╡ 6ae1c5d0-4021-40ac-9bc0-bb9d0fab9fa4
TableOfContents()

# ╔═╡ 49fe3920-26ab-4873-8413-3418d5552f7f
data_theme = "dark";

# ╔═╡ 2e47591b-1156-4f07-9934-f7983a801c2c
function index_title_card(title::String, subtitle::String, image_url::String; data_theme::String = "pastel", border_color::String = "primary")
	return to_html(
	    divv(
	        head(
				link(:href => "https://cdn.jsdelivr.net/npm/daisyui@3.7.4/dist/full.css", :rel => "stylesheet", :type => "text/css"),
	            script(:src => "https://cdn.tailwindcss.com")
	        ),
			divv(:data_theme => "$data_theme", :class => "card card-bordered flex justify-center items-center border-$border_color text-center w-full dark:text-[#e6e6e6]",
				divv(:class => "card-body flex flex-col justify-center items-center",
					img(:src => "$image_url", :class => "h-24 w-24 md:h-40 md:w-40 rounded-md", :alt => "$title Logo"),
					divv(:class => "text-5xl font-bold bg-gradient-to-r from-accent to-primary inline-block text-transparent bg-clip-text py-10", "$title"),
					p(:class => "card-text text-md font-serif", "$subtitle"
					)
				)
			)
	    )
	)
end;

# ╔═╡ e72eb673-ee5e-4e61-9188-0c7381efbdab
index_title_card(
	"GlassDocs",
	"Publish, interactive Pluto.jl notebooks with one click",
	"https://github.com/Dale-Black/GlassDocs/blob/master/images/icon-512x512.png?raw=true";
	data_theme = data_theme
)

# ╔═╡ 4e1f222a-213a-4e4b-a53a-8e801b5041a0
struct Article
	title::String
	path::String
	image_url::String
end

# ╔═╡ 3235397b-1b36-403a-afda-4b0c08b907fa
article_list_tutorials = Article[
	Article("Getting Started", "01_getting_started.jl", "https://img.freepik.com/free-vector/hand-drawn-starting-line-business-illustration_23-2149540609.jpg"),
	Article("Advanced Usage", "02_advanced.jl", "https://img.freepik.com/free-vector/trio-set-realistic-technology-collection-with-circels-squares-other-things-centre-blue_1284-49186.jpg"),
];

# ╔═╡ 5100ded4-9580-4911-83bc-df088a1cbcd2
article_list_templates = Article[
	Article("Plain Repository", "templates/plain_repository/index.jl", "https://img.freepik.com/free-vector/notebook-mockup_1017-6288.jpg"),
	Article("Package Documentation", "templates/ExamplePackage/index.jl", "https://img.freepik.com/free-vector/online-document-concept-illustration_114360-5453.jpg"),
	Article("Teaching (TODO)", "", "https://img.freepik.com/free-vector/teacher-standing-near-blackboard-holding-stick-isolated-flat-vector-illustration-cartoon-woman-character-near-chalkboard-pointing-alphabet_74855-8600.jpg"),
	Article("Meta Package (TODO)", "", "https://img.freepik.com/free-vector/four-blue-puzzle-pieces_78370-1141.jpg"),
];

# ╔═╡ 3b764991-4764-4e01-b9a4-eecc0810d798
article_list_examples = Article[
	Article("CalciumScoring.jl Docs", "https://glassnotebook.io/r/zn0Xr-A1cYegYHSDJzSyO/docs/index.jl", "https://img.freepik.com/free-vector/ct-scan-concept-illustration_114360-7073.jpg"),
	Article("Brain Dancer GUI", "https://glassnotebook.io/r/Wx63p40sJffuoB_ZkFy_D/index.jl", "https://alascience.com/wp-content/uploads/2020/07/Logo-registered-trademark.jpg"),
	Article("DistanceTransforms.jl Docs", "https://glassnotebook.io/r/DxnIPJnIqpEqiQnJgqiBP/docs/index.jl", "https://img.freepik.com/free-vector/global-communication-background-business-network-vector-design_53876-151122.jpg"),
	Article("Computational Thinking (in Glass Notebook) (TODO)", "https://computationalthinking.mit.edu/Fall23/", "https://user-images.githubusercontent.com/6933510/136196552-ce16c06f-bd12-427f-80e5-aedb1fbc734a.png")
];

# ╔═╡ 7ba5d949-ab06-4b2f-bb9c-5731bce9f73f
function article_card(article::Article, color::String; data_theme = "pastel")
    a(:href => article.path, :class => "w-1/2 p-2",
		divv(:data_theme => "$data_theme", :class => "card card-bordered border-$color text-center dark:text-[#e6e6e6]",
			divv(:class => "card-body justify-center items-center h-40",
				p(:class => "card-title", article.title),
				p("Click to open the notebook")
			),
			figure(
				img(:class => "w-full h-48", :src => article.image_url, :alt => article.title)
			)
        )
    )
end;

# ╔═╡ 305ef451-9de9-4005-8495-2066052e9be8
to_html(
    divv(:class => "flex flex-wrap justify-center items-start",
        [article_card(article, "secondary"; data_theme = data_theme) for article in article_list_tutorials]...
    )
)

# ╔═╡ e3012e28-b3ef-4007-a550-92444a6c783d
to_html(
    divv(:class => "flex flex-wrap justify-center items-start",
        [article_card(article, "primary"; data_theme = data_theme) for article in article_list_templates]...
    )
)

# ╔═╡ 0b32fad4-0ec7-4590-952f-ec438ce1900a
to_html(
    divv(:class => "flex flex-wrap justify-center items-start",
        [article_card(article, "accent"; data_theme = data_theme) for article in article_list_examples]...
    )
)

# ╔═╡ Cell order:
# ╟─e72eb673-ee5e-4e61-9188-0c7381efbdab
# ╟─ba9e26af-94fc-47e0-9dfe-03fd0468c0c7
# ╟─305ef451-9de9-4005-8495-2066052e9be8
# ╟─6cb7945c-6e2d-46fd-bf1c-fa51971645bd
# ╟─e3012e28-b3ef-4007-a550-92444a6c783d
# ╟─5a5af88e-b35d-4660-90e9-60a864ae77bb
# ╟─0b32fad4-0ec7-4590-952f-ec438ce1900a
# ╟─546b7906-c112-4225-aa81-e7138ae352cb
# ╟─d6bd6300-5b14-4ab4-b519-ed59b466adb9
# ╠═6ae1c5d0-4021-40ac-9bc0-bb9d0fab9fa4
# ╠═d871cef8-5f6d-4279-8949-616b6ca76396
# ╠═49fe3920-26ab-4873-8413-3418d5552f7f
# ╠═2e47591b-1156-4f07-9934-f7983a801c2c
# ╠═4e1f222a-213a-4e4b-a53a-8e801b5041a0
# ╠═3235397b-1b36-403a-afda-4b0c08b907fa
# ╠═5100ded4-9580-4911-83bc-df088a1cbcd2
# ╠═3b764991-4764-4e01-b9a4-eecc0810d798
# ╠═7ba5d949-ab06-4b2f-bb9c-5731bce9f73f
