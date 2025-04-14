Section 1: Overview and Introduction: This section should answer the following questions at a  
very high level \- about a paragraph or two total.

* What were the goals of this project?  
* What did you do?  
* What were the approaches or methods you used?

Section 2: Methodology and Results

- A. Construction of the Jungle Bridge and Characterization of the Building Materials
	- For the rubber band bridge
		- How did you characterize and then model the spring properties of the rubber bands, including any measurements or regression analysis you did?  
	    * What configuration did you choose (number of rubber bands, weights) for the rubber band bridge you built?  
	    * In this section, you should include and embed (and make explicit reference to) the following tables, figures and photos:
		    * TABLE 1: A table with the measured data (weight(s) added, corresponding stretched length) for each of your rubber bands.
		    * TABLE 2: A table showing the stiffness, k, and the natural length, lo, of each rubber band.
		    * TABLE 3: A table of the x-y coordinates of each of the measured positions of the rubber band bridge
		    * TABLE 4: A table of how much each of the individual weights used in the construction of the rubber band Jungle bridge weight weigh
		    * FIGURE 1: For a single rubber band of your choice, a plot comparing the line of best fit to the measured data, including appropriately labeled axes, a legend, and caption.
		    * FIGURE 2: For the same rubber band, a contour plot OR a 3D surface plot showing the cost function E(m, b), including appropriately labeled axes, a legend and caption.
		    * FIGURE 3: Photo of your rubber band bridge
* For the string bridge  
    * How did you characterize the properties of the strings including any measurements you performed?  
    * What configuration did you choose (number of rubber bands, weights) for the string bridge you built?  
    * In this section, you should include and embed (and make explicit reference to) the following tables, figures and photos.
	    * TABLE 5: A table of the measurements of the lengths of the strings used in the construction of the string Jungle Bridge
	    * TABLE 6: A table of how much each of the individual weights used in the construction of the string Jungle bridge weight weigh
	    * TABLE 7: A table of the x-y coordinates of each of the measured positions of the string bridge.
	    * FIGURE 4: Photo of your string bridge  
* B. Using Gradient Descent Optimization for the Jungle Bridge \- Unconstrained Optimization  
	* Describe your methodology: provide a description of how to compute a numerical gradient and how to perform gradient descent, including appropriate equations and/or snippets of code
	* The Jungle Bridge Simulator takes measurements from the different parts of the jungle bridge and provides an estimate at where the bridge as a whole will hang. In unconstrained optimization, there are no given values and no assumptions on maximum or minimum lengths. The optimization function takes the potential energy function as a cost function and continuously uses gradient descent to step towards a minimum until it is within a certain threshold. 
	* Share your results: include and discuss appropriate plots comparing your measured jungle bridge to predicted jungle bridge configuration.
	* In this section, you should include and embed (and make explicit reference to) the following tables, figures and photos  
	    * FIGURE 5: A visualization of the progression of the gradient descent method starting from the initial guess on the appropriate potential function (similar to Figure 24.5 in the Day 18 activity).  
	    * FIGURE 6: Comparison plot between your measured (solid line) and predicted (dashed line) bridge geometry for the rubber band (unconstrained) case including appropriately labeled axes, a legend and caption.  
* C. Using Gradient Descent Optimization for the Jungle Bridge \- Constrained Optimization  
	* Describe your methodology: Provide a description of the constrained optimization approach to gradient descent, including appropriate equations and/or snippets of code.  
	* Explain the difference between the constrained and unconstrained optimization approaches.  
	* Share your results: include and discuss appropriate plots comparing your measured jungle bridge to predicted jungle bridge configuration.  
	* In this section, you should include (and make explicit reference to) the following tables, figures and photos:  
	    * FIGURE 7: Comparison plot between your measured (solid line) and predicted (dashed line) bridge geometry for the string (constrained) case including appropriately labeled axes, a legend and caption.

Section 3: Interpretation of Results and Discussion: In this section, please address the following:

* How well does the gradient descent optimization predict the position of the rubber band Jungle Bridge? Of the string Jungle Bridge?  
* What sources of error might contribute to any differences you see? What sources of error do you think contribute the most? How might you approach reducing the effects of these sources?

Section 4: Team Attribution: A brief attribution statement in your report, at the end, which lists  
the members of the team and aspects of the report they may have been primarily responsible for or generally contributed to.  
Section 5: Code and Supplementary Documentation: Alongside your report, please submit all  
your code, and any supplementary artifacts/evidence/documents that you may have generated for your project. We will be checking for the following:

* The submitted MatLab files are all .m scripts; no .mlx files will be accepted  
* Good annotation/commenting practices are used  
  * Functions have "docstrings" or comments that describe their purpose, the inputs expected, and any outputs generated  
  * Key methodological steps are documented with a brief comment



![](https://media.discordapp.net/attachments/372211737191120897/1358904336247291964/IMG_3536.jpg?ex=67f589c8&is=67f43848&hm=6f5f5f29a77cad5524e63d09a1be16d0414aa74ba8460a885d8e2a32869ee7cd&=&format=webp&width=1066&height=800)

![](https://media.discordapp.net/attachments/372211737191120897/1358904337023111188/IMG_3534.jpg?ex=67f589c9&is=67f43849&hm=14bd99c3a3f14cdfc3bae4ca6d83ca45e7dc9851cae7e125a228af40ff37eb2c&=&format=webp&width=1066&height=800)