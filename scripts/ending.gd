extends ColorRect

func _ready():
	print($"/root/global".ignored_sign,$"/root/global".kicked_alco,$"/root/global".ending)
	$Label.text = $"/root/global".ending + ' КОНЦОВКА'
