FLAGS = 

MLX = -I /usr/local/include -L /usr/local/lib -lmlx

FRAMEWORKS = -framework OpenGl -framework Appkit

NAMELIB = libft.a

NAME = cub3D

EXEC = cub3D

SRC = cub3d.c read_file.c read_map.c utils.c random_utils.c draw_minimap.c

OBJ = $(SRC:.c=.o)

all : $(NAME)

$(NAMELIB) :
	make -C libft/
	cp libft/$(NAMELIB) .

$(NAME) : $(NAMELIB)
	gcc $(FLAGS) $(SRC) -g3 -I /usr/local/include libft.a get_next_line/get_next_line.c get_next_line/get_next_line_utils.c -L /usr/local/lib -lmlx -framework OpenGl -framework Appkit -Ofast -D BUFFER_SIZE=20 -D L_C=F -o $(EXEC)

clean :
	make clean -C libft/
	rm -f *.o

fclean : clean
	make fclean -C libft/
	rm -f *.a
	rm -f $(EXEC)

re : fclean all