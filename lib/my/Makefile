##
## EPITECH PROJECT, 2017
## df
## File description:
## fe
##

SRC	=	infin_add.c

OBJ	=	$(SRC:.c=.o)

OBJ2	=	$(SRC:.c=.c~)

NAME	=	infin_add

all:	$(NAME)

$(NAME):	$(OBJ)
	gcc -o $(NAME)	$(OBJ)

clean:
	rm -f $(OBJ) $(OBJ2)

fclean:	clean
	rm -f $(NAME)	$(OBJ2)

re:	fclean all

auteur:
	echo $(USER) > muchery
