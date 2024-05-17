resource "aws_cloudformation_stack" "webserver-base-instance" {
	name = "webserver-base-instance-stack"
	template_url = "webserver-base-instance.yaml"
}