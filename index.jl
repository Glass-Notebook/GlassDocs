### A Pluto.jl notebook ###
# v0.19.40

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

# ╔═╡ 9ad2c090-bc90-44e3-975c-658d53c36627
# ╠═╡ show_logs = false
begin
	using Pkg; Pkg.activate("."); Pkg.instantiate()

	using HTMLStrings
	using PlutoUI
end

# ╔═╡ 295d0378-ea73-4f2d-8de2-bb5bf7cc73eb
begin
	using PlutoUI: Slider
	using CairoMakie: scatterlines!, Figure, Axis, ylims!
end

# ╔═╡ fd2ea21c-e343-4955-a6ba-84a644b39ba3
begin
	using CairoMakie: hist!, scatter!, axislegend
	using RDatasets: dataset
end

# ╔═╡ 1da93604-7a6b-4eac-b8a0-9405c62eae58
to_html(
	divv(
		h1("Glass Notebook", :style => "border-bottom: none; margin-bottom: 0;"),
		h4("Empowering Developers to Create and Share Interactive Notebooks", :style => "margin-top: 0; margin-bottom: 40px; padding-bottom: 10px; border-bottom: 1px solid #ccc;"),
		divv(
			p("Discover how Glass Notebook can revolutionize the way you create, share, and collaborate on interactive notebooks, documentation, and data-driven applications.", :style => "margin-bottom: 40px;"),
			divv(:style => "display: flex; justify-content: space-around; flex-wrap: wrap; margin-bottom: 60px;",
				divv(:style => "width: 100%; max-width: 300px; text-align: center; margin-bottom: 40px;",
					img(:src => "https://img.icons8.com/dusk/64/000000/code-file.png", :alt => "Seamless Integration with Pluto.jl", :style => "margin-bottom: 20px;"),
					p("Seamlessly integrate with Pluto.jl to create powerful, interactive notebooks")
				),
				divv(:style => "width: 100%; max-width: 300px; text-align: center; margin-bottom: 40px;",
					img(:src => "https://img.icons8.com/small/64/000000/github.png", :alt => "GitHub Integration and Version Control", :style => "margin-bottom: 20px;"),
					p("Built-in GitHub integration for easy version control and collaboration")
				),
				divv(:style => "width: 100%; max-width: 300px; text-align: center;",
					img(:src => "https://img.icons8.com/dusk/64/000000/cheap-2.png", :alt => "Generous Free Tier and Affordable Pricing", :style => "margin-bottom: 20px;"),
					p("Take advantage of our generous free tier and reasonably priced paid plans")
				)
			),
			p("Continue reading to learn more about how Glass Notebook can help you create engaging, interactive content and share your work with the world."),
			style("""
			ul {
				list-style-type: none;
				padding: 0;
			}
			li {
				margin-bottom: 10px;
			}
			img {
				display: block;
				margin: 0 auto;
			}
			p {
				margin-top: 10px;
			}
			@media screen and (min-width: 768px) {
				.benefit {
					width: 30%;
					margin-bottom: 0;
				}
			}
			""")
		)
	)
)

# ╔═╡ b14bcfc9-59ee-4ad7-9da4-cc527191c964
md"""
!!! success "Built with Glass Notebook"
	This notebook is a living example of the power and versatility of Glass Notebook. Every interactive element, visualization, and piece of content you see here was created and published using Glass Notebook, demonstrating its ability to create compelling, interactive documentation seamlessly.
"""

# ╔═╡ e0d8cde6-a2b3-4e1c-b69e-4be3a7ab1162
md"""
!!! success ""
    ### Interactive Notebook Example
	Experience the interactivity of Glass Notebook firsthand with this interactive plot. Adjust the amplitude slider to see how the plot updates in real-time, just like it would in your own Glass Notebook.
"""

# ╔═╡ 4a014675-bc4a-4972-8250-625b1f9276fa
begin
	x = 0:0.1:10
	y1 = sin.(x)
	y2 = cos.(x)
end

# ╔═╡ 423b8559-adf5-4208-a1d4-3d904386163f
@bind amplitude Slider(0.1:0.1:2, default=1, show_value=true)

# ╔═╡ 038760be-35b0-4c28-82be-2c1d5050ad71
let
	f = Figure()
	ax = Axis(f[1, 1], title = "Sine & Cosine Plot")
	scatterlines!(ax, x, amplitude .* y1, label="Sine")
	scatterlines!(ax, x, amplitude .* y2, label="Cosine")
	ylims!(low = -2.25, high = 2.25)
	axislegend()
	f
end

# ╔═╡ 30261e92-5452-48f9-8167-09e486d5383d
md"""
!!! success ""
    ### Interactive Dashboard Example
	Explore this interactive dashboard, created entirely within Glass Notebook, to see how easy it is to build and publish dynamic, data-driven visualizations.
"""

# ╔═╡ 8ea2e241-d259-4393-b768-4569d8936296
iris = dataset("datasets", "iris");

# ╔═╡ 8c4b31ae-699c-45bf-8c24-a15a522cfae5
md"""
**Interactive Iris Dashboard**

Select Species: $(@bind species Select(unique(iris.Species)))
"""

# ╔═╡ a2141211-c00c-41e5-81b8-b687b2f8e41c
let
	f = Figure(size = (800, 800))
    ax = Axis(
		f[1, 1:2], 
		xlabel="Sepal Length", 
		ylabel="Frequency"
	)
	sepal_lengths = iris[iris.Species .== species, :SepalLength]
	hist!(ax, sepal_lengths, bins=range(4, 8, length=10), color=(:dodgerblue, 0.5), label=species)

	ax = Axis(
		f[2, 1],
		xlabel=string(:SepalWidth),
		ylabel=string(:PetalLength)
	)
    for species in unique(iris.Species)
        data = iris[iris.Species .== species, :]
        scatter!(ax, data[:, :SepalWidth], data[:, :PetalLength], label=species)
    end
    axislegend()

	ax = Axis(
		f[2, 2],
		xlabel=string(:SepalLength),
		ylabel=string(:PetalWidth)
	)
    for species in unique(iris.Species)
        data = iris[iris.Species .== species, :]
        scatter!(ax, data[:, :SepalLength], data[:, :PetalWidth], label=species)
    end
    axislegend()
	f
end

# ╔═╡ 64d221b6-a568-4191-b8ec-2e7baec85994
md"""
## Get Started with Glass Notebook

Ready to revolutionize your development workflow and take your interactive notebooks to the next level? Get started with Glass Notebook today and experience the power of interactive notebooks, seamless collaboration, and powerful web applications.

1. **Sign up for Free**: Take advantage of our generous free tier and start creating interactive notebooks right away. Enjoy unlimited static notebook exports and explore the features of Glass Notebook. [Sign up now](https://glassnotebook.io/)

2. **Explore the Documentation**: Dive into our comprehensive documentation to learn more about Glass Notebook's features, best practices, and advanced usage. Start with the [Getting Started](01_getting_started.jl) guide and explore the possibilities.

3. **Join the Community**: Connect with other developers, share your projects, and get inspired by the Glass Notebook community. Join our [Zulip chat](https://julialang.zulipchat.com/#narrow/stream/428178-glassnotebook) to chat or reach out via email [support@glassnotebook.io](mailto:support@glassnotebook.io)

Don't miss out on this opportunity to transform your development workflow and create engaging, interactive content. Sign up for Glass Notebook today and start bringing your ideas to life!
"""

# ╔═╡ aa0a27d6-3394-4f44-9d32-6c94ba83ac33
TableOfContents()

# ╔═╡ 0436ca99-0216-4ca1-928f-683dc2beae31
carousel_css = """
.carousel {
    position: relative;
    width: 100%;
    height: 100vh;
    overflow-y: auto;
    color: var(--pluto-output-color);
}

.carousel-item {
    display: none;
    padding: 20px;
    width: 100%;
    max-height: 100%;
    border-radius: 5px;
    background-color: var(--pluto-output-bg-color);
    overflow-y: auto;
}

.carousel-item.active {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
}

.carousel-control {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    font-size: 18px;
    color: var(--pluto-output-color);
    text-decoration: none;
    cursor: pointer;
}

.carousel-control.prev {
    left: 5px;
}

.carousel-control.next {
    right: 5px;
}

.rounded {
    width: auto;
    height: 200px;
    margin-bottom: 10px;
    border-radius: 5px;
    border: 1px solid;
}

.rounded-small {
    width: auto;
    height: 150px;
    margin-bottom: 10px;
    border-radius: 5px;
    border: 1px solid;
}

.carousel-item ul {
    margin-top: 10px;
    padding-left: 20px;
}

.carousel-item li {
    margin-bottom: 10px;
}

.comparison-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 14px;
}

.comparison-table th,
.comparison-table td {
    padding: 8px;
    text-align: center;
    border: 1px solid #ddd;
}

.comparison-table th {
    background-color: #e0f2fe;
    color: black;
}

.feature-column {
    background-color: #f4f4f5;
    font-weight: bold;
}

.glass-notebook-column {
    background-color: #dcfce7;
}

.excel-column {
    background-color: #fef9c3;
}

.powerpoint-column {
    background-color: #fee2e2;
}

@media screen and (min-width: 768px) {
    .carousel-item {
        padding: 40px;
    }

    .carousel-control {
        font-size: 24px;
    }

    .carousel-control.prev {
        left: 10px;
    }

    .carousel-control.next {
        right: 10px;
    }

    .rounded {
        height: 300px;
        margin-bottom: 20px;
        border-radius: 10px;
    }

    .rounded-small {
        height: 200px;
        margin-bottom: 20px;
        border-radius: 10px;
    }

    .carousel-item ul {
        margin-top: 20px;
    }

    .carousel-item li {
        margin-bottom: 20px;
    }

    .comparison-table {
        font-size: 18px;
    }

    .comparison-table th,
    .comparison-table td {
        padding: 10px;
    }
}

@media screen and (min-width: 1024px) {
    .rounded {
        height: 400px;
    }

    .rounded-small {
        height: 300px;
    }
}
""";

# ╔═╡ b2e32a9b-dd95-4ddd-9590-7275b67cabd4
function carousel_script(carousel_id) 
	return """
	function initCarousel() {
		const carousel = document.querySelector('#$(carousel_id)');
		const carouselItems = carousel.querySelectorAll('.carousel-item');
		const prevButton = carousel.querySelector('.carousel-control.prev');
		const nextButton = carousel.querySelector('.carousel-control.next');
		let currentIndex = 0;
	
		function showSlide(index) {
			carouselItems[currentIndex].classList.remove('active');
			carouselItems[index].classList.add('active');
			currentIndex = index;
		}
	
		function showNextSlide(e) {
			e.preventDefault();
			let nextIndex = (currentIndex + 1) % carouselItems.length;
			showSlide(nextIndex);
		}
	
		function showPrevSlide(e) {
			e.preventDefault();
			let prevIndex = (currentIndex - 1 + carouselItems.length) % carouselItems.length;
			showSlide(prevIndex);
		}
	
		nextButton.addEventListener('click', showNextSlide);
		prevButton.addEventListener('click', showPrevSlide);
	}
	initCarousel();
	"""
end;

# ╔═╡ fca88ada-6830-4b42-968f-783a4a554c0a
to_html(
	divv(:id => "key-features-carousel", :class => "carousel",
		h2("Key Features"),
		divv(:class => "carousel-item active",
			ul(
				li("Seamless integration with Pluto.jl for creating interactive notebooks"),
				li("GitHub integration for version control and collaboration"),
				li("Publish notebooks as interactive web applications or static sites"),
				li("Generous free tier and affordable pricing for individual developers and teams"),
				li("Secure sharing of interactive content with code privacy"),
			),
			img(:class => "rounded-small", :src => "https://i.imgur.com/zS5FJI6.gif", :alt => "Overview")
		),
        divv(:class => "carousel-item",
			h4("Interactive Notebooks with Pluto.jl"),
			p("Glass Notebook seamlessly integrates with Pluto.jl, enabling you to create dynamic, interactive notebooks that update in real-time as you modify code or explore data. Bring your ideas to life with engaging, interactive content."),
			img(:class => "rounded", :src => "https://i.imgur.com/SNXYQHe.gif", :alt => "Interactive Notebook GIF")
        ),
		divv(:class => "carousel-item",
		    h4("GitHub Integration and Collaboration"),
			p("Glass Notebook offers built-in GitHub integration, making version control and collaboration a breeze. Simply utilize Git/GitHub as you already do, and in one-click, export your notebook/repository on Glass Notebook."),
			img(:class => "rounded", :src => "https://images.unsplash.com/photo-1618401471353-b98afee0b2eb?q=80&w=2976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", :alt => "Collaboration Example")
		),
		divv(:class => "carousel-item",
		    h4("Publish Interactive Web Apps and Static Sites"),
			p("With Glass Notebook, you can publish your notebooks as fully interactive web applications or static websites. Share your work with the world and let others explore your ideas and insights firsthand."),
			img(:class => "rounded", :src => "https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=2426&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", :alt => "Publishing Example")
		),
		divv(:class => "carousel-item",
		    h4("Secure Sharing with Code Privacy"),
			p("Glass Notebook's integration with GitHub and support for private repositories allows you to share interactive content with your team or the public while maintaining code privacy. Share your work with confidence, knowing your intellectual property is secure."),
			img(:class => "rounded", :src => "https://images.unsplash.com/photo-1555529902-5261145633bf?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", :alt => "Secure Sharing Example")
		),
		a(:class => "carousel-control prev", :href => "#", "&#10094;"),
		a(:class => "carousel-control next", :href => "#", "&#10095;"),
		style(carousel_css),
		script(carousel_script("key-features-carousel")),
	)
)

# ╔═╡ 32210bb4-2730-4457-89bc-e74ea9e7b52f
to_html(
	divv(:id => "benefits-carousel", :class => "carousel",
		h2("Unlock the Benefits of Glass Notebook"),
		divv(:class => "carousel-item active",
			h4("Empower Your Development Workflow"),
			p("Glass Notebook empowers you to streamline your development workflow by providing a single, integrated platform for creating, sharing, and collaborating on interactive notebooks, documentation, and data-driven applications."),
			ul(
				li("Seamlessly move from idea to interactive notebook to published application"),
				li("Eliminate the need for multiple tools and platforms"),
				li("Ensure consistency and reproducibility across your projects"),
			),
			img(:class => "rounded", :src => "https://images.unsplash.com/photo-1529310399831-ed472b81d589?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZWZmaWNpZW50fGVufDB8fDB8fHww", :alt => "Workflow Example")
		),
		divv(:class => "carousel-item",
			h4("Collaborate with Ease"),
			p("Glass Notebook's built-in GitHub integration and collaboration features make it easy to work with your team on projects, share ideas, and gather feedback."),
			ul(
				li("Seamlessly integrate with your existing GitHub workflow"),
				li("Track changes and collaborate using familiar tools like pull requests and issues"),
				li("Maintain code privacy while sharing interactive content"),
			),
			img(:class => "rounded", :src => "https://images.unsplash.com/photo-1630514969818-94aefc42ec47?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", :alt => "Collaboration Example")
		),
		divv(:class => "carousel-item",
			h4("Bring Your Ideas to Life"),
			p("With Glass Notebook, you can bring your ideas to life by creating engaging, interactive content that showcases your work and insights."),
			ul(
				li("Create dynamic, interactive notebooks using Pluto.jl"),
				li("Publish notebooks as fully interactive web applications or static sites"),
				li("Share your work with the world and gather feedback from users"),
			),
			img(:class => "rounded", :src => "https://images.unsplash.com/photo-1493612276216-ee3925520721?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", :alt => "Ideas Example")
		),
		divv(:class => "carousel-item",
			h4("Affordable Pricing for Developers"),
			p("Glass Notebook offers a generous free tier and reasonably priced paid plans, making it accessible to individual developers and teams of all sizes."),
			ul(
				li("Get started with our free tier and create up to 5 public notebooks"),
				li("Upgrade to a paid plan for additional features and private notebook support"),
				li("Enjoy affordable pricing that scales with your needs"),
			),
			img(:class => "rounded", :src => "https://plus.unsplash.com/premium_photo-1680196764069-2c373356fee9?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", :alt => "Pricing Example")
		),
		a(:class => "carousel-control prev", :href => "#", "&#10094;"),
		a(:class => "carousel-control next", :href => "#", "&#10095;"),
		style(carousel_css),
		script(carousel_script("benefits-carousel")),
	)
)

# ╔═╡ f26de4b1-78a3-4314-b265-84b6a8ea7991
to_html(
	divv(:id => "advanced-features-carousel", :class => "carousel",
		h2("Advanced Features"),
        divv(:class => "carousel-item active",
			p("Glass Notebook offers advanced features that simplify complex documentation and enable the creation of powerful web applications."),
			img(:class => "rounded", :src => "https://images.unsplash.com/photo-1582120050926-68ba0fb56275?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcGxleHxlbnwwfHwwfHx8MA%3D%3D", :alt => "Advanced Features")
        ),
        divv(:class => "carousel-item",
			h4("Automatic Sidebar and Nested Docs"),
			p("Glass Notebook automatically generates a sidebar based on your notebook structure, making it easy to navigate complex documentation and create a cohesive narrative."),
			ul(
				li("Automatically generated sidebar for easy navigation"),
				li("Nested docs feature to organize and link related content"),
				li("Create interactive stories and guided tutorials"),
			),
			img(:class => "rounded", :src => "https://i.imgur.com/E4PwSH8.png", :alt => "Sidebar Example")
        ),
        divv(:class => "carousel-item",
			h4("Powerful Web Applications"),
			p("Glass Notebook enables the creation and deployment of powerful web applications, including AI-driven tools and dashboards."),
			ul(
				li("Build and deploy complex web apps using Julia and Pluto.jl"),
				li("Integrate AI and machine learning models seamlessly"),
				li("Create interactive, data-driven dashboards"),
			),
			p("Check out this example of a powerful AI-based web app built and deployed using Glass Notebook:"),
			a(:href => "https://glassnotebook.io/r/-mTfQ715HEjOHRVkIWLd9/image_segmentation_makie.jl", :target => "_blank", "AI-Powered Web App",
			img(:class => "rounded", :src => "https://i.imgur.com/K8nmPm4.gif", :alt => "AI Web App Example")
			),
        ),
        a(:class => "carousel-control prev", :href => "#", "&#10094;"),
        a(:class => "carousel-control next", :href => "#", "&#10095;"),
        style(carousel_css),
        script(carousel_script("advanced-features-carousel")),
    )
)

# ╔═╡ Cell order:
# ╟─1da93604-7a6b-4eac-b8a0-9405c62eae58
# ╟─b14bcfc9-59ee-4ad7-9da4-cc527191c964
# ╟─fca88ada-6830-4b42-968f-783a4a554c0a
# ╟─e0d8cde6-a2b3-4e1c-b69e-4be3a7ab1162
# ╠═295d0378-ea73-4f2d-8de2-bb5bf7cc73eb
# ╠═4a014675-bc4a-4972-8250-625b1f9276fa
# ╟─423b8559-adf5-4208-a1d4-3d904386163f
# ╟─038760be-35b0-4c28-82be-2c1d5050ad71
# ╟─32210bb4-2730-4457-89bc-e74ea9e7b52f
# ╟─30261e92-5452-48f9-8167-09e486d5383d
# ╠═fd2ea21c-e343-4955-a6ba-84a644b39ba3
# ╠═8ea2e241-d259-4393-b768-4569d8936296
# ╟─8c4b31ae-699c-45bf-8c24-a15a522cfae5
# ╟─a2141211-c00c-41e5-81b8-b687b2f8e41c
# ╟─f26de4b1-78a3-4314-b265-84b6a8ea7991
# ╟─64d221b6-a568-4191-b8ec-2e7baec85994
# ╟─9ad2c090-bc90-44e3-975c-658d53c36627
# ╟─aa0a27d6-3394-4f44-9d32-6c94ba83ac33
# ╟─0436ca99-0216-4ca1-928f-683dc2beae31
# ╟─b2e32a9b-dd95-4ddd-9590-7275b67cabd4
