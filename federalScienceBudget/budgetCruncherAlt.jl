using DataFrames
using CSV

dataframe = DataFrame(CSV.File("fy2023Alt.csv"))
dataPoints = dataframe[!, :BudgetInMillions]
totalBudget = sum(dataPoints)
budgetInPercent = [100. * dataPoint / totalBudget for dataPoint in dataPoints]

dataframe[!, :BudgetInPercent] = budgetInPercent
println(dataframe)

using Plots
using PlotThemes

institutions = dataframe[!, :Agency]
theme(:dark)
pie(institutions, budgetInPercent, legend=:outerleft, title = "2023 federal R&D budget by\nfunction")
savefig("budgetShareFy2023Alt.png")
