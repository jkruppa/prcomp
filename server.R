library(shiny)
library(mvtnorm)
library(scatterplot3d)
library(gplots)

shinyServer(function(input, output) {

	output$plots <- renderPlot({
		set.seed(123)
		d = 100
		n = 30
		mu = rep(0, d)
		S = matrix(NA, d, d)
		for (i in 1:d) {
		for (j in 1:d) {
			S[i,j] = 0.9^abs(i-j)
		}}
		X = t(rmvnorm(n, mu, S))
		X[1:20,1:10] = X[1:20,1:10] + input$fc1
		X[21:40,11:20] = X[21:40,11:20] + input$fc2
		X[41:60,21:30] = X[41:60,21:30] + input$fc3
		X[61:80,1:20] = X[61:80,1:20] + input$fc4
		group = gl(3, n/3)
		pca = prcomp(t(X))
		pca = predict(pca)
		#plot(pca, main="Principal component plot", cex.lab=1.5, cex.axis=1.5, cex.main=1.5, col=as.numeric(group)+1, cex=1.5, lwd=2)
		SP = scatterplot3d(pca[,1], pca[,2], pca[,3], cex.lab=1.5, cex.axis=1.5, xlab="PC1", ylab="PC2", zlab="PC3", cex=2, color=as.numeric(group)+1, lwd=2)
		SP$points3d(pca[,1], pca[,2], pca[,3], color=1, type="h")
	})
	
	output$plots2 <- renderPlot({
		set.seed(123)
		d = 100
		n = 30
		mu = rep(0, d)
		S = matrix(NA, d, d)
		for (i in 1:d) {
		for (j in 1:d) {
			S[i,j] = 0.9^abs(i-j)
		}}
		X = t(rmvnorm(n, mu, S))
		X[1:20,1:10] = X[1:20,1:10] + input$fc1
		X[21:40,11:20] = X[21:40,11:20] + input$fc2
		X[41:60,21:30] = X[41:60,21:30] + input$fc3
		X[61:80,1:20] = X[61:80,1:20] + input$fc4
		group = gl(3, n/3)
		colo = as.character(as.numeric(group)+1)
		heatmap.2(X, trace="none", ColSideColors=colo)
	})

})
