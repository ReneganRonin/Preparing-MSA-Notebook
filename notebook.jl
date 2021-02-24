### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 56149f20-7681-11eb-2fb8-7ffc671caf1b
begin
	import Pkg
	Pkg.add(["Images", "ImageMagick", "Colors", "PlutoUI", "HypertextLiteral"])
	
	using Images
	using Colors
	using PlutoUI
	using HypertextLiteral
end

# ╔═╡ c5878590-767f-11eb-0a1a-497b8c2072a2
md"""
# Complete Process of Media Preparation of Mannitol Salt Agar (MSA)
The complete process of preparing culture media from sterilization of tools to preparation of the culture medium.
"""

# ╔═╡ 0e5e8c28-7680-11eb-2cda-1d9188d7914d
md"""
## Sterilization
"""

# ╔═╡ 466ceba8-7680-11eb-0e75-7d4ed07502ac
sterile_url = "https://image.slidesharecdn.com/sterilizationprocess-190907172803/95/sterilization-process-1-638.jpg?cb=1568130563";

# ╔═╡ ea218fc6-7680-11eb-11d3-7b21a454ac42
sterile_file = download(sterile_url, "sterile_example.jpg");

# ╔═╡ 3342b49e-7681-11eb-2546-2b12635afa30
sterile = load(sterile_file)

# ╔═╡ 41a3b92c-7681-11eb-2860-1def67365f18
md"""
Sterilization is the process that removes or kills any microorganisms in a specific surface or tools.
"""

# ╔═╡ e57759ae-7680-11eb-101d-f35278c2b046
md"""
Before we start creating the medium, we sterilize first the needed materials most likely used in the following:
"""

# ╔═╡ 416bcbf4-7689-11eb-200c-23013800d6c9
begin
	petridishes = load("petridishes.jpg")
	stirringrod = load("stirringrod.jpg")
	autoclave = load("autoclave.jpg")
	beakers = load("beakers.jpg")
	beakers = imresize(beakers, ratio=1/2)
	petridishes = imresize(petridishes, ratio=1/2)
	autoclave = imresize(autoclave, ratio=1/1.2)
	stirringrod = imresize(stirringrod, ratio=1/2)
end;

# ╔═╡ 85cedbd8-7689-11eb-2482-87597fafff11
stirringrod

# ╔═╡ 5085ea5c-768c-11eb-3221-e5f23db99162
petridishes

# ╔═╡ 55104c7e-768c-11eb-0432-499d2be17ab9
autoclave

# ╔═╡ 427a7ed2-7689-11eb-248e-ed024c3db254
beakers

# ╔═╡ 90379c14-768d-11eb-3cc2-3d362aca04c9
md"""
And other materials for safety handling and sanitizing of work area:
- Heat resistant gloves
- 70% ethyl or isopropyl alcohol
- Tissue and disinfectant wipes
- Forceps and scapulas

And for weighing, use a balance for solid ingredients. Bring what might be needed and remove any other materials that might not be needed.
"""

# ╔═╡ d05cc058-768d-11eb-2f70-a1680efb0f62
md"""
Using a plastic wrap, wrap and put all glasswares or heat resistant containers (rods, flasks, beakers, petri dishes) inside the plastic wrap. Put them inside an autoclave for sterilization using the proper pressure and heat.
"""

# ╔═╡ 01f663c8-768f-11eb-1bca-17ef796f53b1
md"""
## Calculating the needed amount of distilled water and culture medium
We need 5 petri plates for one student and the hypothetical number of students is 20. Here, we are going to prepare for MSA which is about **111.02 grams per Liter**. We will assume that the petri plates need about **20mL** each.

"""

# ╔═╡ 5d46ec18-768f-11eb-1c19-d327452face2
begin
	n_petri = 5  # number of petri plates per student
	n_students = 20  # number of students in the class
	vol_petri = 20  # the volume of each petri dish or plate
end;

# ╔═╡ 36721b16-7690-11eb-0cf5-db50fb694102
md"""
Multiply 20 students by 5 to get the total number of plates. Then multiply the product by 20 to get the total volume.
"""

# ╔═╡ 4f8052da-7690-11eb-38c7-95b34136e7e2
total_n_petri = n_petri * n_students

# ╔═╡ 81333b94-7690-11eb-1b38-61f4da57b2d8
total_vol_petri = total_n_petri * vol_petri

# ╔═╡ 33d5f7c4-7690-11eb-1d56-db90c402e8de
md"""
Usually an additional n amount of mL is added to compensate the amount of liquid when it evaporates during dissolving the medium. We will show that later.
"""

# ╔═╡ 1a1bc33a-7691-11eb-3976-8d4948384d03
md"""
We know the needed amount to dissolve MSA in a liter or **1000 milliliters** of distilled water -> 111.02 grams. Therefore,
"""

# ╔═╡ 49dc1818-7691-11eb-054c-87ff833fc9f6
needed_amount_of_msa = total_vol_petri * (111.02 / 1000);

# ╔═╡ efbbe452-7691-11eb-317e-7d8759b7faaf
md"""
we need $needed_amount_of_msa grams of Mannitol Salt Agar to dissolve in $total_vol_petri milliters. This is enough for all 20 students, each having 5 petri plates.
"""

# ╔═╡ 58bd85de-7693-11eb-19da-9da8cdc39fe7
@bind number_of_students Slider(1:100)

# ╔═╡ 9dd16688-7693-11eb-18bf-5b07dc1056e4
begin
	total_petri = n_petri * number_of_students
	total_v_petri = total_petri * vol_petri
	amount_needed_msa = round(total_v_petri * (111.02 / 1000); sigdigits=5)
	with_contingency = round((total_v_petri + 20) * (111.02 / 1000); sigdigits=5)
end;

# ╔═╡ d5a0322e-7693-11eb-08fe-59ca135b77e5
md"""
We can see also see the amount of MSA for n number of students as well each having 5 petri plates using the slider above. We also show when adding another 20mL as contingency.

- Normal
  - **$(number_of_students) students needs $(amount_needed_msa) grams of MSA per $(total_v_petri) milliliters**.
- With contingency
  - **$(number_of_students) students needs $(with_contingency) grams of MSA per $(total_v_petri + 20) milliliters**.
"""

# ╔═╡ a291c5d6-7694-11eb-2df7-bb45c436b20a
md"""
# Back to readying the media
"""

# ╔═╡ 9c6d8c92-7696-11eb-14c7-87aab6c67673
md"""
Sanitize and clean your work area thoroughly. Carefully remove the glasswares from the autoclave using safety gloves or forceps (whatever works). Weigh the amount of MSA needed using a balance which is $needed_amount_of_msa grams for every $total_vol_petri milliliters.
"""

# ╔═╡ 8ab0dd34-7698-11eb-1021-a7302e72ff24
load("comparison.jpg")

# ╔═╡ 9e735588-7698-11eb-2cea-a5914f28934c
md"""
Put the MSA into a glass container (e.g. beaker or flask) and pour distilled water, and stir.

Others use a flask to heat and dissolve, while we use a beaker and oven to heat and dissolve. Eitherway, both works. Make sure that it is completely dissolved; you can determine this when there are no more clumps and the solution is clear and not cloudy

Once dissolved, readily pour it over 5 plates per student with the right amount. Cover it and wait for it to solidify. You're basically done!
"""

# ╔═╡ 5d6f81b4-7699-11eb-28f0-13f333ebb3c7


# ╔═╡ bd7ff954-7698-11eb-28eb-530e4e850250


# ╔═╡ Cell order:
# ╟─c5878590-767f-11eb-0a1a-497b8c2072a2
# ╟─56149f20-7681-11eb-2fb8-7ffc671caf1b
# ╟─0e5e8c28-7680-11eb-2cda-1d9188d7914d
# ╟─466ceba8-7680-11eb-0e75-7d4ed07502ac
# ╟─ea218fc6-7680-11eb-11d3-7b21a454ac42
# ╟─3342b49e-7681-11eb-2546-2b12635afa30
# ╟─41a3b92c-7681-11eb-2860-1def67365f18
# ╟─e57759ae-7680-11eb-101d-f35278c2b046
# ╟─416bcbf4-7689-11eb-200c-23013800d6c9
# ╠═85cedbd8-7689-11eb-2482-87597fafff11
# ╠═5085ea5c-768c-11eb-3221-e5f23db99162
# ╠═55104c7e-768c-11eb-0432-499d2be17ab9
# ╠═427a7ed2-7689-11eb-248e-ed024c3db254
# ╟─90379c14-768d-11eb-3cc2-3d362aca04c9
# ╟─d05cc058-768d-11eb-2f70-a1680efb0f62
# ╟─01f663c8-768f-11eb-1bca-17ef796f53b1
# ╠═5d46ec18-768f-11eb-1c19-d327452face2
# ╟─36721b16-7690-11eb-0cf5-db50fb694102
# ╟─4f8052da-7690-11eb-38c7-95b34136e7e2
# ╟─81333b94-7690-11eb-1b38-61f4da57b2d8
# ╟─33d5f7c4-7690-11eb-1d56-db90c402e8de
# ╟─1a1bc33a-7691-11eb-3976-8d4948384d03
# ╠═49dc1818-7691-11eb-054c-87ff833fc9f6
# ╟─efbbe452-7691-11eb-317e-7d8759b7faaf
# ╟─9dd16688-7693-11eb-18bf-5b07dc1056e4
# ╟─58bd85de-7693-11eb-19da-9da8cdc39fe7
# ╟─d5a0322e-7693-11eb-08fe-59ca135b77e5
# ╟─a291c5d6-7694-11eb-2df7-bb45c436b20a
# ╟─9c6d8c92-7696-11eb-14c7-87aab6c67673
# ╟─8ab0dd34-7698-11eb-1021-a7302e72ff24
# ╟─9e735588-7698-11eb-2cea-a5914f28934c
# ╟─5d6f81b4-7699-11eb-28f0-13f333ebb3c7
# ╟─bd7ff954-7698-11eb-28eb-530e4e850250
