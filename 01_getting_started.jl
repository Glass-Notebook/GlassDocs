### A Pluto.jl notebook ###
# v0.19.40

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

# ╔═╡ 1d8726bd-beb6-428c-a814-c2cd78e4de4f
using HTMLStrings

# ╔═╡ 35fe1b3d-a789-44f9-b33f-5cb7b5fa7eef
md"""
# Getting Started

[Glass Notebook](https://glassnotebook.io/) is a powerful platform that simplifies the process of publishing Pluto notebooks as interactive or static websites. With Glass Notebook, you can easily share your work with others, whether you're creating documentation, tutorials, or data-driven stories. In this guide, we'll walk you through the steps to get started with Glass Notebook.
"""

# ╔═╡ 8c2161ae-632c-4f9c-b49f-9ad4eacfa718
md"""
## 3. Share Notebook(s)

Once you've linked your repository and configured your notebooks, you can easily share them with others. To share a notebook:

1. Navigate to the notebook you want to share
2. Right-click on the notebook URL
3. Select "Copy Link" or "Copy Link Address" (depending on your browser)
4. Share the copied link with others via email, chat, or any other preferred method

You can also add a markdown badge to your repository's README file to provide a quick link to your Glass Notebook documentation. To get the badge URL:

1. Navigate to your notebook on Glass Notebook
2. Click on the "Share" button
3. Copy the markdown badge code provided
4. Paste the code into your repository's README file

[![Glass Notebook](https://img.shields.io/badge/Docs-Glass%20Notebook-aquamarine.svg)](https://glassnotebook.io/r/fPuxqzHi6mmOvzXwVNxuK/index.jl)
"""

# ╔═╡ 19d5b4f7-b084-470b-9195-edc104030d47
md"""
## Next Steps

Congratulations! You're now ready to start using Glass Notebook to create and share interactive notebooks. Here are some additional resources to help you get the most out of the platform:

- [Advanced Usage](02_advanced_usage.jl): Learn about customizing your notebooks and using advanced features
- [Community Zulip Forum](https://julialang.zulipchat.com/#narrow/stream/428178-glassnotebook): Connect with other Glass Notebook users, ask questions, and share your projects
- [Contact Support](mailto:support@glassnotebook.io): If you need further assistance, don't hesitate to reach out to our support team
"""

# ╔═╡ 7d73a5fc-b9e9-4d04-90ec-e57f19eddf38
TableOfContents()

# ╔═╡ 7cf42c75-d89a-4167-89aa-7f1d9639e0ee
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

# ╔═╡ 0df07984-57af-4b77-a54c-3c8577a03784
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

# ╔═╡ 2bd53372-56c0-4161-bdea-ac495dda7baf
to_html(
	divv(:id => "sign-in-carousel", :class => "carousel",
		h2("1. Sign In"),
		p("To begin using Glass Notebook, you'll need to sign in with your GitHub account. Follow these steps:"),
		ol(
			li("Go to https://glassnotebook.io/"),
			li("Click on the \"Get Started\" button in the upper right-hand corner"),
			li("Click on the \"Sign in with GitHub\" button"),
			li("Authorize Glass Notebook to access your GitHub account")
		),
		divv(:class => "carousel-item active",
			img(:class => "rounded", :src => "https://github.com/Dale-Black/GlassDocs/blob/master/assets/homepage.jpeg?raw=true", :alt => "Glass Notebook Homepage")
		),
		divv(:class => "carousel-item",
			img(:class => "rounded", :src => "https://github.com/Dale-Black/GlassDocs/blob/master/assets/githubsignin.jpeg?raw=true", :alt => "Sign in with GitHub")
		),
		divv(:class => "carousel-item",
			img(:class => "rounded", :src => "https://github.com/Dale-Black/GlassDocs/blob/master/assets/authgithub.jpeg?raw=true", :alt => "Authorize Glass Notebook")
		),
		a(:class => "carousel-control prev", :href => "#", "&#10094;"),
		a(:class => "carousel-control next", :href => "#", "&#10095;"),
		style(carousel_css),
		script(carousel_script("sign-in-carousel")),
	)
)

# ╔═╡ 8f2eec55-5583-4932-b947-4e0096ed439c
to_html(
	divv(:id => "link-repository-carousel", :class => "carousel",
		h2("2. Link Repository"),
		p("After signing in, you'll need to link a GitHub repository containing your Pluto notebooks. A repository is a folder that contains all the files and folders related to your project. To link a repository:"),
		ol(
			li("Click on the \"Add Notebook\" button"),
			li("Paste your GitHub repository URL or select a repository directly through GitHub"),
			li("Choose the privacy setting for your linked repository (private or public)"),
			li("Toggle the cloud icon next to each notebook to make it interactive or static")
		),
		divv(:class => "carousel-item active",
			img(:class => "rounded", :src => "https://github.com/Dale-Black/GlassDocs/blob/master/assets/addnotebook.jpeg?raw=true", :alt => "Add Notebook")
		),
		divv(:class => "carousel-item",
			img(:class => "rounded", :src => "https://github.com/Dale-Black/GlassDocs/blob/master/assets/toggleprivate.jpeg?raw=true", :alt => "Toggle Privacy")
		),
		divv(:class => "carousel-item",
			img(:class => "rounded", :src => "https://i.imgur.com/iuKjDGK.png", :alt => "Toggle Interactivity")
		),
		a(:class => "carousel-control prev", :href => "#", "&#10094;"),
		a(:class => "carousel-control next", :href => "#", "&#10095;"),
		style(carousel_css),
		script(carousel_script("link-repository-carousel")),
	)
)

# ╔═╡ Cell order:
# ╟─35fe1b3d-a789-44f9-b33f-5cb7b5fa7eef
# ╟─2bd53372-56c0-4161-bdea-ac495dda7baf
# ╟─8f2eec55-5583-4932-b947-4e0096ed439c
# ╟─8c2161ae-632c-4f9c-b49f-9ad4eacfa718
# ╟─19d5b4f7-b084-470b-9195-edc104030d47
# ╟─e7d4da2c-a413-41a4-b72b-b9f5d414a177
# ╟─f1f67e1f-9608-4465-a771-ef742ee7e648
# ╟─1d8726bd-beb6-428c-a814-c2cd78e4de4f
# ╟─7d73a5fc-b9e9-4d04-90ec-e57f19eddf38
# ╟─7cf42c75-d89a-4167-89aa-7f1d9639e0ee
# ╟─0df07984-57af-4b77-a54c-3c8577a03784
