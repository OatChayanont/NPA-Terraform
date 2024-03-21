# resource "aws_lb" "publicLoadBalancer" {
#   name = "publicLoadBalancer"
#   load_balancer_type = "application"
#   security_groups = [aws_security_group.AllowSSHandWeb.id]
#   subnets = [aws_subnet.Public["1"].id,aws_subnet.Public["2"].id]
#   tags = merge(local.default_tags,{
#     Name = "${var.default_name}-publicLoadBalancer"
#   })
# }
# resource "aws_lb_listener" "publicLoadBalancer_listener" {
#   load_balancer_arn = aws_lb.publicLoadBalancer.id
#   port = 80
#   protocol = "HTTP"
#   default_action {
#     type = "forward"
#     target_group_arn = aws_lb_target_group.publicLoadBalancer_target_group.arn
#   }
# }

# resource "aws_lb_target_group" "publicLoadBalancer_target_group" {
#   name = "publicLoadBalancertarget"
#   port = 80
#   protocol = "HTTP"
#   vpc_id = aws_vpc.testVPC.id
# }

# resource "aws_lb_target_group_attachment" "publicLoadBalancer_target_group_attachment" {
#   count = 2
#   target_group_arn = aws_lb_target_group.publicLoadBalancer_target_group.arn
#   target_id = aws_instance.testweb[count.index].id
#   port = 80
# }
