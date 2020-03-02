#Generate a Box plot for anorexia treatment patients who have undergone 3 types of treatment
#1. Cognitive Behavioural Therapy (CBT), Control Treatment (Cont), Family Therapy (FT)
#The Preweight and Post weight values are provided.

#The Box plot for Threatment vs Pre-weight.
ggplot(anorexia, aes(x=Treat, y=Prewt)) +
  geom_boxplot() +
  geom_point()

ggplot(anorexia, aes(x=Treat,y=Postwt)) +
  geom_boxplot()


ggplot(anorexia, aes(x=Treat,y=Postwt-Prewt)) +
  geom_boxplot()

#Anorexia Analysis

anorexia.analysis <- lm(as.numeric(Treat) ~ Prewt + Postwt, data=anorexia)

summary(anorexia.analysis)