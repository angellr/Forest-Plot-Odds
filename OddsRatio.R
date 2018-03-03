library(forestplot)

################################
##
## Written by Bob Angell, University of Utah School of Medicine, Biomedical Informatics, 2018
## This code may be freely used if proper attribution is used. 
## 
## Contact Information: bob.angell@utah.edu; angellr@mac.com; mobile: 801-706-2520
##
################################

tabletext6r <-cbind(
  c("", "Reported Output", NA, 
    "Myocardial", "Infarction:", NA, "Actual OR Values:", 
    "  - Treatment Cohort 1::Control Group", "  - Treatment Cohort 2::Control Group", NA,
    "Predicted OR Values:",
    "  - Treatment Cohort 1::Control Group", "  - Treatment Cohort 2::Control Group", NA,
    NA, "Stroke:", NA, "Actual OR Values:", 
    "  - Treatment Cohort 1::Control Group", "  - Treatment Cohort 2::Control Group", NA,
    "Predicted OR Values:", 
    "  - Treatment Cohort 1::Control Group", "  - Treatment Cohort 2::Control Group", NA),
  c("", "Odds Ratio", NA, NA, NA, NA, NA,"2.736","4.442", NA, NA, "2.803","4.819",
    NA, NA, NA, NA, NA, "1.586","2.468", NA, NA, "3.221","5.261", NA),
  c("", "95% CI         ", NA, NA, NA, NA, NA,"[2.367, 3.172]", "[3.422, 5.864]", NA, NA,
    "[2.403, 3.282]", "[3.618, 6.562]", NA, NA, NA, NA, NA, 
    "[1.353, 1.864]", "[1.883, 3.290]", NA, NA, "[2.545, 4.129]", "[3.364, 8.802]", NA))

test_data6r <- data.frame(coef=c(1.0,1.0,1.0,1.0,1.0,1.0,1.0,2.735859,4.441623,1.0,1.0,2.802563,4.818541,1.0,1.0,1.0,1.0,1.0,1.586217,2.468267,1.0,1.0,3.220623,5.260547,1.0),
                          low=c(1.0,1.0,1.0,1.0,1.0,1.0,1.0,2.366774,3.421781,1.0,1.0,2.402648,3.61757,1.0,1.0,1.0,1.0,1.0,1.353498,1.883456,1.0,1.0,2.545073,3.364363,1.0),
                          high=c(1.0,1.0,1.0,1.0,1.0,1.0,1.0,3.172091,5.863719,1.0,1.0,3.281633,6.562495,1.0,1.0,1.0,1.0,1.0,1.863867,3.289665,1.0,1.0,4.128537,8.8023,1.0),
                          boxsize=c(.005,.005,.005,.005,.005,.005,.005,.35,.35,.005,.005,.35,.35,.005,.005,.005,.005,.005,.35,.35,.005,.005,.35,.35,.005))



forestplot(tabletext6r,
           hrzl_lines = list("2" = gpar(col="#444444"),
                             "3" = gpar(lwd=50, lineend="butt", col="salmon", alpha = 0.15),
                             "7" = gpar(col="#444444"),
                             "8" = gpar(col="#444444"),
                             "9" = gpar(lwd=100, lineend="butt", col="salmon", alpha = 0.15),
                             "11" = gpar(col="#444444"),
                             "12" = gpar(col="#444444"),
                             "15" = gpar(col="#444444"),
                             "20" = gpar(lwd=100, lineend="butt", col="salmon", alpha = 0.15),
                             "18" = gpar(col="#444444"),
                             "19" = gpar(col="#444444"),
                             "22" = gpar(col="#444444"),
                             "23" = gpar(col="#444444"),
                             "26" = gpar(col="#444444")),
           test_data6r$coef,
           test_data6r$low,
           test_data6r$high,
           new_page = TRUE,
           is.summary=c(rep(TRUE,2),rep(FALSE,1),rep(TRUE,2),rep(FALSE,1),TRUE,rep(FALSE,3),
                        TRUE,rep(FALSE,4),TRUE,rep(FALSE,1),TRUE,rep(FALSE,3),TRUE,rep(FALSE,3)),
           
           txt_gp=fpTxtGp(label=gpar(cex=1.1),
                          ticks=gpar(cex=1.0),
                          xlab=gpar(cex = 1.2),
                          title=gpar(cex = 1.3)),
           zero = 1,
           cex  = 5,
           col=fpColors(box=c("red", "blue"),
                        line=c("royal blue", "royal blue")),
           grid = TRUE,
           ci.vertices = TRUE,
           graph.pos = 2,
           boxsize = test_data6r$boxsize,
           
           lineheight = unit(7,"mm"),
           title = "Hazard Rate (Odds Ratio): Comparison of Treatment Cohorts to Control Group",
           xlab = "Odds Ratio of Control Groups over Treatment Cohorts as a Baseline"
)