### A Pluto.jl notebook ###
# v0.19.40

#> [frontmatter]
#> title = "Advanced Usage"
#> category = "Tutorials"

using Markdown
using InteractiveUtils

# ╔═╡ 46581809-1673-45c7-8cc1-40bf12b2a8d7
# ╠═╡ show_logs = false
using Pkg; Pkg.activate("."); Pkg.instantiate()

# ╔═╡ 463236e3-f8e0-4748-bbfc-4a4331c61ea6
# ╠═╡ show_logs = false
using PlutoUI

# ╔═╡ 1d8def68-dd46-4ff4-b0d8-5d8303748fce
using PlutoTeachingTools

# ╔═╡ 70554597-c3b3-44ed-a784-b04127af54cf
using HTMLStrings

# ╔═╡ 9d11e80c-26f7-4aa6-8d8e-c9e2bcbe220f
to_html(
	divv(
		h1("Advanced Usage"),
		p(
			a(:href => "https://glassnotebook.io/", "Glass Notebook"), " offers a versatile platform for publishing Pluto notebooks as interactive or static websites. It caters to a wide range of users, from those seeking simple documentation to advanced users who require interactive features and real-time data handling. Below, we explore the various customizations and export options available in Glass Notebook, designed to enhance user experience and meet diverse needs"
		)
	)
)

# ╔═╡ e5e3e9d5-e056-4cab-ad08-19f440f9491e
to_html(
	divv(
		h1("Layout Options"),
		p("Glass Notebook provides several layout options to structure and organize your documentation effectively:"),
		ol(
			li(strong("Automatic Sidebar Layout"), ": Glass Notebook generates a sidebar automatically based on your Pluto notebook names and structure."),
			li(strong("Nested Project Layout"), ": Customize the sidebar using a ", code("structure.json"), " file to include notebooks from multiple packages or projects."),
			li(strong("Hyper-Nested Layout (Coming Soon)"), ": Combine multiple nested projects into a single interface using a ", code("navbar.json"), " file.")
		)
	)
)

# ╔═╡ 1188b880-be48-45f9-bd5f-faa03934b9f1
Foldable(
	"Example `structure.json` file",
	md"""
	!!! info "Corresponds to this GlassDocs repository"
		```json
		{
		  "sidebar": {
		    "title": "GlassDocs.jl",
		    "elements": [
		      {
		        "type": "notebook",
		        "path": "index.jl",
		        "title": "Home"
		      },
		      {
		        "type": "folder",
		        "title": "Tutorials",
		        "defaultOpened": true,
		        "elements": [
		          {
		            "type": "notebook",
		            "path": "01_getting_started.jl",
		            "title": "Getting Started"
		          },
		          {
		            "type": "notebook",
		            "path": "02_advanced_usage.jl",
		            "title": "Advanced Usage"
		          }
		        ]
		      },
		      {
		        "type": "folder",
		        "title": "Examples",
		        "defaultOpened": false,
		        "elements": [
		          {
		            "type": "folder",
		            "title": "Package Docs",
		            "defaultOpened": false,
		            "elements": [
		              {
		                "type": "folder",
		                "title": "CalciumScoring.jl",
		                "path": "CalciumScoring.jl",
		                "defaultOpened": false
		              },
		              {
		                "type": "folder",
		                "title": "Losers.jl",
		                "path": "Losers.jl",
		                "defaultOpened": false
		              },
		              {
		                "type": "folder",
		                "title": "DistanceTransforms.jl",
		                "path": "DistanceTransforms.jl",
		                "defaultOpened": false
		              }
		            ]
		          },
		          {
		            "type": "folder",
		            "title": "Tutorials",
		            "defaultOpened": false,
		            "elements": [
		              {
		                "type": "folder",
		                "title": "TidierCourse",
		                "path": "TidierCourse",
		                "defaultOpened": false
		              }
		            ]
		          },
		          {
		            "type": "folder",
		            "title": "Teaching",
		            "defaultOpened": false,
		            "elements": []
		          },
		          {
		            "type": "folder",
		            "title": "Dashbords",
		            "defaultOpened": false,
		            "elements": [
		              {
		                "type": "folder",
		                "title": "PlutoDashboards",
		                "path": "PlutoDashboards",
		                "defaultOpened": false
		              }
		            ]
		          },
		          {
		            "type": "folder",
		            "title": "Web Applications",
		            "defaultOpened": false,
		            "elements": []
		          },
		          {
		            "type": "folder",
		            "title": "Nested Projects",
		            "defaultOpened": false,
		            "elements": []
		          }
		        ]
		      }
		    ]
		  }
		}
		```
	"""
)

# ╔═╡ 4c9f2468-23b1-4bd3-aafa-8dcf06bf9d7d
md"""
# Other Features

## Glass Ignore Export (`.glassignore`)

Glass Notebook automatically indexes every Pluto notebook contained within a GitHub repository. These notebooks will then be exported by Glass. If certain notebooks are not meant for export, they can be included in a `.glassignore` file. This file will tell Glass to ignore any notebooks in the repository that match the string given - which follows the same regex rules as `.gitignore` on GitHub.

For example, say you want to ignore the notebook located at the path `Repository.jl/test/expensive_notebook.jl`. Any of the following entries in the `.glassignore` file would successfully tell Glass Notebook to avoid the `expensive_notebook.jl` when exporting:

```bash
# example .glassignore file:

**expensive_notebook.jl
Repository.jl/test/expensive_notebook.jl
# etc...
```

## Links
Links work inside Glass Notebook just like they do in regular Markdown. Relative links (e.g., [link to other notebook]()) will be automatically parsed and linked properly in Glass.

You can use links to:

- Link to other notebooks within the same project
- Link to notebooks in different nested projects
- Link to external websites or resources

Glass Notebook will handle the proper resolution of these links, ensuring that users can easily navigate between notebooks and access external resources.

## API Documentation
By writing our package doc strings in a specific way, you can take advantage of the wonderful `PlutoUI.jl` package and Glass Notebook in order to create an automatic API notebook for your package documentation, like in [this example](https://github.com/Dale-Black/Losers.jl/blob/master/docs/99_api.jl) which gets exported [like so](Losers.jl/docs/99_api.jl).
"""

# ╔═╡ f4914413-531e-408f-85bc-87448e9c2987
TableOfContents()

# ╔═╡ 02686122-3914-413b-8914-2f3b70e002e2
carousel_css = """
.carousel {
    position: relative;
    width: 100%;
    height: 80vh;
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
    margin-bottom: 2px;
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
        height: 250px;
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

@media screen and (min-width: 2000px) {
    .rounded {
        height: 400px;
    }

    .rounded-small {
        height: 300px;
    }
}
""";

# ╔═╡ c206e2ae-21c0-4012-98a6-8540e0a42285
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

# ╔═╡ 5cc2ae1e-54a3-4559-82fb-caa2ca074f4f
to_html(
	divv(:id => "notebook-export-options-carousel", :class => "carousel",
		h2("Notebook Export Options"),
		divv(:class => "carousel-item active",
			p("This section aims to guide users in selecting the right type of notebook export to match their specific project requirements, ensuring efficient and effective use of Glass Notebook's features."),
			p(:style => "font-weight:bold", "We automatically determine where pre-computed (interactive) or fully-interactive (live) notebooks are needed, so you don't have to worry about it."),
			table(:class => "comparison-table",
				thead(
					tr(
						th("Notebook Type"),
						th("Interactivity Level"),
						th("Data Injection Capability"),
						th("Relative Cost")
					)
				),
				tbody(
					tr(
						td("Static Notebooks", :class => "feature-column"),
						td("None", :class => "glass-notebook-column"),
						td("No", :class => "excel-column"),
						td("Lowest", :class => "powerpoint-column")
					),
					tr(
						td("Precomputed (Interactive) Notebooks", :class => "feature-column"),
						td("Interactive UIs", :class => "glass-notebook-column"),
						td("No", :class => "excel-column"),
						td("Medium", :class => "powerpoint-column")
					),
					tr(
						td("Fully Interactive (Live) Notebooks", :class => "feature-column"),
						td("Full", :class => "glass-notebook-column"),
						td("Yes (e.g., data uploads)", :class => "excel-column"),
						td("Highest", :class => "powerpoint-column")
					)
				)
			)
		),
		divv(:class => "carousel-item",
			h4("Static Notebooks"),
			p("Ideal for basic viewing needs, these notebooks offer no interactivity or data injection and are free to export"),
			ul(
				li("No interactivity"),
				li("No data injection"),
				li("Lowest cost")
			),
			img(:class => "rounded-small", :src => "https://images.unsplash.com/photo-1611434132218-d687f8a5f378?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3RhdGljfGVufDB8fDB8fHww", :alt => "Static Notebook Example")
		),
		divv(:class => "carousel-item",
			h4("Precomputed (Interactive) Notebooks"),
			p("Also known as \"pre-computed slider servers\", these notebooks provide interactive user interfaces without real-time data capabilities. They are self-contained and can be pre-computed, striking a balance between interactivity and cost."),
			ul(
				li("Interactive user interfaces"),
				li("No real-time data capabilities"),
				li("Medium cost"),
				li("Suitable for notebooks with self-contained data")
			),
			img(:class => "rounded-small", :src => "https://images.unsplash.com/photo-1509099652299-30938b0aeb63?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", :alt => "Precomputed Notebook Example")
		),
		divv(:class => "carousel-item",
			h4("Fully Interactive (Live) Notebooks"),
			p("For the most advanced usage, these notebooks offer full interactivity with real-time data handling capabilities, such as data uploads, making them suitable for complex applications. They require a full-time running server."),
			ul(
				li("Full interactivity"),
				li("Real-time data handling (e.g., data uploads)"),
				li("Highest cost"),
				li("Suitable for notebooks that allow user uploads or real-time data processing")
			),
			img(:class => "rounded-small", :src => "https://images.unsplash.com/photo-1534078362425-387ae9668c17?q=80&w=2938&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", :alt => "Fully Interactive Notebook Example")
		),
		a(:class => "carousel-control prev", :href => "#", "&#10094;"),
		a(:class => "carousel-control next", :href => "#", "&#10095;"),
		style(carousel_css),
		script(carousel_script("notebook-export-options-carousel")),
	)
)

# ╔═╡ f830d549-e0fd-49ce-8871-989b3c32dbcb
to_html(
	divv(:id => "automatic-sidebar-layout-carousel", :class => "carousel",
		h2("1. Automatic Sidebar Layout"),
		divv(:class => "carousel-item active",
			p("The Automatic Sidebar Layout is the simplest option, requiring no additional setup. Glass Notebook creates a sidebar based on your Pluto notebook names and their directory structure."),
			ul(
				li("No manual configuration needed"),
				li("Automatically updates as you add, remove, or rename notebooks"),
				li("Notebook titles can be customized using Pluto's frontmatter")
			),
			img(:class => "rounded-small", :src => "https://i.imgur.com/YFUFii5.png", :alt => "Simple Sidebar")
		),
		divv(:class => "carousel-item",
			img(:class => "rounded", :src => "https://i.imgur.com/x57zqCX.png", :alt => "Save Pluto Notebook")
		),
		divv(:class => "carousel-item",
			img(:class => "rounded", :src => "https://i.imgur.com/ClmUYH3.png", :alt => "Edit Frontmatter")
		),
		divv(:class => "carousel-item",
			img(:class => "rounded", :src => "https://i.imgur.com/tRAHMjd.png", :alt => "Frontmatter")
		),
		divv(:class => "carousel-item",
			p(strong("Homepage Priority"), ": The ", code("index.jl"), " notebook always appears first in the sidebar, ensuring easy access to the homepage."),
			img(:class => "rounded", :src => "https://github.com/Dale-Black/GlassDocs/blob/master/assets/index.jpeg?raw=true", :alt => "Index Notebook")
		),
		a(:class => "carousel-control prev", :href => "#", "&#10094;"),
		a(:class => "carousel-control next", :href => "#", "&#10095;"),
		style(carousel_css),
		script(carousel_script("automatic-sidebar-layout-carousel")),
	)
)

# ╔═╡ 8303984d-dba1-4336-bba6-e0b303463ae5
to_html(
	divv(:id => "nested-project-layout-carousel", :class => "carousel",
		h2("2. Nested Project Layout"),
		divv(:class => "carousel-item active",
			p("The Nested Project Layout allows you to create a custom sidebar that includes notebooks from multiple packages, projects, or tutorials. By using a ", code("structure.json"), " file, you can define a hierarchical structure that seamlessly integrates notebooks from different sources into a single, cohesive documentation project."),
			ul(
				li("Include notebooks from multiple packages or projects"),
				li("Create a unified structure with folders and subfolders"),
				li("Automatically incorporate updates from linked packages or projects")
			),
			img(:class => "rounded-small", :src => "https://i.imgur.com/px0EdjZ.png", :alt => "Nested Sidebar")
		),
		divv(:class => "carousel-item",
			h4("Implementing a Nested Project Layout:"),
			ol(
				li("Create a ", code("structure.json"), " file in your main project's root directory"),
				li("Define your desired sidebar structure using the provided JSON format"),
				li("Specify the paths to notebooks from different packages or projects"),
				li("Use Git submodules to include the linked packages or projects"),
				li("Export your main project, and the nested sidebar will be generated")
			),
			img(:class => "rounded-small", :src => "https://i.imgur.com/i0WMr0u.gif", :alt => "stucture.json gif")
		),
		a(:class => "carousel-control prev", :href => "#", "&#10094;"),
		a(:class => "carousel-control next", :href => "#", "&#10095;"),
		style(carousel_css),
		script(carousel_script("nested-project-layout-carousel")),
	)
)

# ╔═╡ d8a383fe-be9c-45e4-b616-cf92b772a89f
to_html(
	divv(:id => "hyper-nested-layout-carousel", :class => "carousel",
		h2("3. Hyper-Nested Layout (Coming Soon)"),
		divv(:class => "carousel-item active",
			p("The Hyper-Nested Layout is an upcoming feature that will allow you to combine multiple nested projects into a single, unified interface. With this layout option, you can create a top-level navigation bar using a ", code("navbar.json"), " file, enabling users to easily switch between different nested projects."),
			p("This feature will be particularly useful for creating comprehensive documentation that covers multiple domains or large-scale projects consisting of several nested projects."),
			img(:class => "rounded-small", :src => "https://images.unsplash.com/photo-1614332287897-cdc485fa562d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y29taW5nJTIwc29vbnxlbnwwfHwwfHx8MA%3D%3D", :alt => "Hyper nested layout")
		),
		divv(:class => "carousel-item",
			ul(
				li("Combine multiple nested projects seamlessly"),
				li("Provide a top-level navigation bar for easy access to different projects"),
				li("Create a unified and intuitive documentation experience for users")
			),
			p("Stay tuned for more information on this powerful new feature!"),
			img(:class => "rounded-small", :src => "https://images.unsplash.com/photo-1586892477838-2b96e85e0f96?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8b3JnYW5pemV8ZW58MHx8MHx8fDA%3D", :alt => "Hyper nested layout Organized")
		),
		a(:class => "carousel-control prev", :href => "#", "&#10094;"),
		a(:class => "carousel-control next", :href => "#", "&#10095;"),
		style(carousel_css),
		script(carousel_script("hyper-nested-layout-carousel")),
	)
)

# ╔═╡ Cell order:
# ╟─9d11e80c-26f7-4aa6-8d8e-c9e2bcbe220f
# ╟─5cc2ae1e-54a3-4559-82fb-caa2ca074f4f
# ╟─e5e3e9d5-e056-4cab-ad08-19f440f9491e
# ╟─f830d549-e0fd-49ce-8871-989b3c32dbcb
# ╟─8303984d-dba1-4336-bba6-e0b303463ae5
# ╟─1188b880-be48-45f9-bd5f-faa03934b9f1
# ╟─d8a383fe-be9c-45e4-b616-cf92b772a89f
# ╟─4c9f2468-23b1-4bd3-aafa-8dcf06bf9d7d
# ╟─46581809-1673-45c7-8cc1-40bf12b2a8d7
# ╟─463236e3-f8e0-4748-bbfc-4a4331c61ea6
# ╟─1d8def68-dd46-4ff4-b0d8-5d8303748fce
# ╟─70554597-c3b3-44ed-a784-b04127af54cf
# ╟─f4914413-531e-408f-85bc-87448e9c2987
# ╟─02686122-3914-413b-8914-2f3b70e002e2
# ╟─c206e2ae-21c0-4012-98a6-8540e0a42285
