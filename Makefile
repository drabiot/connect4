# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tchartie <tchartie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/13 22:08:37 by tchartie          #+#    #+#              #
#    Updated: 2025/05/13 22:22:28 by tchartie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#============ NAME ============#

NAME		=		connect4

#========= COMPILATOR =========#

CC			=		cc

#=========== FLAGS ============#

CFLAGS		=		-Wall -Wextra -Werror -I$(INCLUDE) -O2

#=========== COLOR ============#

BASE_COLOR 	=		\033[0;39m
GRAY 		=		\033[0;90m
RED 		=		\033[0;91m
GREEN 		=		\033[0;92m
YELLOW 		=		\033[0;93m
BLUE 		=		\033[0;94m
MAGENTA		=		\033[0;95m
CYAN 		=		\033[0;96m
WHITE		=		\033[0;97m

#========== SOURCES ===========#

INCLUDE		=		inc/

SRCS_DIR	=		src/
OBJS_DIR	=		obj/

SRCS		=		main.c
OBJS		=		$(SRCS:.c=.o)

SRCS_F		=		$(addprefix $(SRCS_DIR),$(SRCS))
OBJS_F		=		$(addprefix $(OBJS_DIR),$(OBJS))

#========= EXECUTABLE =========#

all :				$(NAME)

$(NAME) :			$(OBJS_F)
					@$(CC) $(CFLAGS) $(OBJS_F) -o $(NAME)
					@echo "$(GREEN)connect4 successfully compiled! $(BASE_COLOR)"

$(OBJS_DIR)%.o :	$(SRCS_DIR)%.c $(INCLUDE)
					@mkdir -p $(OBJS_DIR)
					@echo "$(YELLOW)Compiling: $< $(BASE_COLOR)"
					@$(CC) $(CFLAGS) -c $< -o $@

clean :
					@rm -rf $(OBJS_DIR)
					@echo "$(BLUE)connect4 objects files cleanned! $(BASE_COLOR)"

fclean :			clean
					@rm -rf $(NAME)
					@echo "$(CYAN)connect4 executable file cleanned! $(BASE_COLOR)"

re :				fclean all

.PHONY :			all clean fclean re
