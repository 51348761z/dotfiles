for _, group in ipairs({
	"appearance",
	"coding",
	"editor",
	"navigation",
	"integration",
	"ui",
}) do
	require("plugins." .. group)
end
