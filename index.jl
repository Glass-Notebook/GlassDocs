### A Pluto.jl notebook ###
# v0.19.40

#> [frontmatter]
#> title = "GlassDocs"
#> sidebar = "false"

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ a15c60cf-df35-43ef-99ba-e3c70fea793b
# ╠═╡ show_logs = false
begin
	using Pkg; Pkg.activate("."); Pkg.instantiate()

	using HTMLStrings: to_html, head, link, script, divv, h1, img, p, span, a, figure, hr, select, option, label, h2, li, ul
	using PlutoUI, HypertextLiteral
	import AbstractPlutoDingetjes
	import AbstractPlutoDingetjes.Bonds
end

# ╔═╡ f6a952c2-9f71-44a2-a03b-8ac536197b6c
md"""
## Tutorials

Get started with Glass Notebook by following these step-by-step tutorials. Learn the basics of setting up and publishing your first notebook, and then dive into more advanced features and customization options.
"""

# ╔═╡ 08de7324-8ef4-44d0-bbfa-4beff681fcb0
md"""
## Examples
Take a look at some examples of Glass Notebook being used for documentation, tutorials, teaching, dashboards, web applications, and meta-packages. 

If you are ready to get started, take a look at the tutorials above.
"""

# ╔═╡ 0e56e7b7-9138-49b4-8870-0d7e201ed07a
to_html(
	divv(
		h2("Contact Us"),
		ul(:class => "menu bg-base-200 w-full rounded-box space-y-2",
			li(
				a(:class =>"", :href => "https://julialang.zulipchat.com/#narrow/stream/428178-glassnotebook", "Community Zulip Forum")
			),
			li(
				a(:class =>"", :href => "mailto:support@glassnotebook.io", "Email Contact Support")
			)
		)
	)
)

# ╔═╡ 5a0a7f42-dc8a-47fb-ad6b-bd1ba79c95f7
to_html(
	divv(
		p(:class => "h-20"),
		hr()
	)
)

# ╔═╡ 3069374b-197e-498d-ad04-6054d9de0d11
md"""
#### Appendix

Note that the cells used to create this homepage are hidden below. Go to GitHub to view the cells, or even better, look at the examples to start creating your own homepage.
"""

# ╔═╡ efc47ff7-8250-40d0-8c58-38b5380dec8c
TableOfContents()

# ╔═╡ ce2ef882-fc8d-4259-9a37-31170db9c9dd
themes = [
	"light",
	"dark",
	"cupcake",
	"bumblebee",
	"emerald",
	"corporate",
	"synthwave",
	"retro",
	"cyberpunk",
	"valentine",
	"halloween",
	"garden",
	"forest",
	"aqua",
	"lofi",
	"pastel",
	"fantasy",
	"wireframe",
	"black",
	"luxury",
	"dracula",
	"cmyk",
	"autumn",
	"business",
	"acid",
	"lemonade",
	"night",
	"coffee",
	"winter",
];

# ╔═╡ 978efdc4-d597-4b07-8601-459474440cc2
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
					divv(:class => "text-3xl md:text-5xl font-bold bg-gradient-to-r from-accent to-primary inline-block text-transparent bg-clip-text py-10", "$title"),
					p(:class => "card-text text-md font-serif", "$subtitle"
					)
				)
			)
	    )
	)
end;

# ╔═╡ 9f7fff06-92f2-4837-9eab-59150513b2e6
begin
	struct Article
		title::String
		path::String
		image_url::String
	end

	article_list_tutorials = Article[
		Article("Getting Started", "01_getting_started.jl", "https://img.freepik.com/free-vector/hand-drawn-starting-line-business-illustration_23-2149540609.jpg"),
		Article("Advanced Usage", "02_advanced_usage.jl", "https://img.freepik.com/free-vector/trio-set-realistic-technology-collection-with-circels-squares-other-things-centre-blue_1284-49186.jpg"),
	]

	article_list_examples = Article[
		Article("Losers.jl Docs", "Losers.jl/index.jl", "https://img.freepik.com/free-vector/low-self-esteem-woman-looking-into-mirror_23-2148714425.jpg?size=626&ext=jpg&ga=GA1.1.1427368820.1695503713&semt=ais"),
		Article("CalciumScoring.jl Docs", "CalciumScoring.jl/index.jl", "https://img.freepik.com/free-vector/ct-scan-concept-illustration_114360-7073.jpg"),
		Article("Tidier Course", "TidierCourse/index.jl", "https://t3.ftcdn.net/jpg/02/82/53/14/360_F_282531462_K3Mek2df4ExqbE6ylp2uYanKOfpmn8ay.jpg"),
		Article("Pluto Dashboards", "PlutoDashboards/dashboard.jl", "https://img.freepik.com/free-vector/site-stats-concept-illustration_114360-1434.jpg"),
		Article("DistanceTransforms.jl Docs", "DistanceTransforms.jl/index.jl", "https://img.freepik.com/free-vector/global-communication-background-business-network-vector-design_53876-151122.jpg")
	]

	function article_card(article::Article, color::String; data_theme = "pastel")
	    a(:href => article.path, :class => "w-full md:w-1/2 p-2",
			divv(:data_theme => "$data_theme", :class => "card card-bordered border-$color text-center dark:text-[#e6e6e6]",
				divv(:class => "card-body justify-center items-center h-32 md:h-40",
					p(:class => "text-lg md:text-2xl", article.title),
					p(:class => "text-sm md:text-base", "Click to open the notebook")
				),
				figure(
					img(:class => "w-full h-40 md:h-48 object-cover", :src => article.image_url, :alt => article.title)
				)
	        )
	    )
	end
end;

# ╔═╡ aac0e8aa-e54d-42d8-a36b-00c282da5664
# this is a fix for PlutoUI.jl#292
begin
	local result = begin
	"""
	```julia
	Select(options::Vector; [default])
	# or with a custom display value:
	Select(options::Vector{Pair{Any,String}}; [default::Any])
	```

	A dropdown menu - the user can choose an element of the `options` vector.

	See [`MultiSelect`](@ref) for a version that allows multiple selected items.

	# Examples
	```julia
	@bind veg Select(["potato", "carrot"])
	```
	
	```julia
	@bind f Select([sin, cos, tan, sqrt])
	
	f(0.5)
	```

	You can also specify a display value by giving pairs `bound_value => display_value`:
	
	```julia
	@bind f Select([cos => "cosine function", sin => "sine function"])

	f(0.5)
	```
	"""
	struct Select
		options::AbstractVector{Pair}
		default::Union{Missing, Any}
	end
	end
	
	Select(options::AbstractVector; default=missing) = Select([o => o for o in options], default)
	
	Select(options::AbstractVector{<:Pair}; default=missing) = Select(options, default)
	
	function Base.show(io::IO, m::MIME"text/html", select::Select)

		
		# compat code
		if !AbstractPlutoDingetjes.is_supported_by_display(io, Bonds.transform_value)
			compat_element = try
				OldSelect(select.options, select.default)
			catch
				HTML("<span>❌ You need to update Pluto to use this PlutoUI element.</span>")
			end
			return show(io, m, compat_element)
		end

		
		show(io, m, @htl(
			"""<select>$(
		map(enumerate(select.options)) do (i,o)
				@htl(
				"<option value='puiselect-$(i)' selected=$(!ismissing(select.default) && o.first == select.default)>$(
				string(o.second)
				)</option>")
			end
		)</select>"""))
	end

	Base.get(select::Select) = ismissing(select.default) ? first(select.options).first : select.default
	Bonds.initial_value(select::Select) = ismissing(select.default) ? first(select.options).first : select.default
	
	Bonds.possible_values(select::Select) = ("puiselect-$(i)" for i in 1:length(select.options))
	
	function Bonds.transform_value(select::Select, val_from_js)
		if startswith(val_from_js, "puiselect-")
			val_num = tryparse(Int64, @view val_from_js[begin+10:end])
			select.options[val_num].first
		else
			# and OldSelect was rendered
			val_from_js
		end
	end
	
	function Bonds.validate_value(select::Select, val_from_js)
		(val_from_js isa String) || return false
		if startswith(val_from_js, "puiselect-")
			val_num = tryparse(Int64, @view val_from_js[begin+10:end])
			val_num isa Integer && val_num ∈ eachindex(select.options)
		else
			# and OldSelect was rendered
			any(key == val_from_js for (key,val) in select.options)
		end
	end

	nothing
end

# ╔═╡ 9511c3ab-6132-46de-a836-687c46ce36d9
md"""
Choose Theme: $(@bind theme Select(themes, default = "night"))
"""

# ╔═╡ 12e21e58-ceb1-4ad9-b21f-f817eca2fa3b
data_theme = theme;

# ╔═╡ 090624ce-384c-4d6e-bd2a-262d5e0f6bc2
index_title_card(
	"GlassDocs",
	"Publish interactive Pluto.jl notebooks with one click",
	"https://github.com/Dale-Black/GlassDocs/blob/master/assets/icon.png?raw=true";
	data_theme = data_theme
)

# ╔═╡ 628e9ccc-7d52-48ef-a1f2-dd5092079422
to_html(
    divv(:class => "flex flex-col md:flex-row flex-wrap justify-center items-start",
        [article_card(article, "accent"; data_theme = data_theme) for article in article_list_tutorials]...
    )
)

# ╔═╡ 197b4d59-d97d-4ea2-8cc0-5cd286b9d59d
to_html(
    divv(:class => "flex flex-col md:flex-row flex-wrap justify-center items-start",
        [article_card(article, "secondary"; data_theme = data_theme) for article in article_list_examples]...
    )
)

# ╔═╡ Cell order:
# ╟─9511c3ab-6132-46de-a836-687c46ce36d9
# ╟─090624ce-384c-4d6e-bd2a-262d5e0f6bc2
# ╟─f6a952c2-9f71-44a2-a03b-8ac536197b6c
# ╟─628e9ccc-7d52-48ef-a1f2-dd5092079422
# ╟─08de7324-8ef4-44d0-bbfa-4beff681fcb0
# ╟─197b4d59-d97d-4ea2-8cc0-5cd286b9d59d
# ╟─0e56e7b7-9138-49b4-8870-0d7e201ed07a
# ╟─5a0a7f42-dc8a-47fb-ad6b-bd1ba79c95f7
# ╟─3069374b-197e-498d-ad04-6054d9de0d11
# ╟─a15c60cf-df35-43ef-99ba-e3c70fea793b
# ╟─efc47ff7-8250-40d0-8c58-38b5380dec8c
# ╟─12e21e58-ceb1-4ad9-b21f-f817eca2fa3b
# ╟─ce2ef882-fc8d-4259-9a37-31170db9c9dd
# ╟─978efdc4-d597-4b07-8601-459474440cc2
# ╟─9f7fff06-92f2-4837-9eab-59150513b2e6
# ╟─aac0e8aa-e54d-42d8-a36b-00c282da5664
