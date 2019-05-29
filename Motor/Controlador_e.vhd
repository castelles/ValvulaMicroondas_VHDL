library ieee;
use ieee.std_logic_1164.all;

-- Adicionei novos blocos lógicos no diagrama (tres MUX, um deles eu mesmo implementei para necessidade)
-- O pino de start_keyboard é ALTO quando o botão de start do microondas for ativado e BAIXO quando não
-- houver nada.
-- A mesma coisa pro start_btt só que pro bluetooth
-- O cancel_keyboard funciona basicamente da mesma forma; ele fica em ALTO quando o botão de cancela for
-- pressionado no teclado e BAIXO quando não hover nenhuma ação
-- O pino de input KEY_SET na minha ideia fica como uma chave!!! Quando a chave estiver ACIONADA, quer
-- dizer que é o teclado que está fazendo a entrada de dados.
-- Quando a chave estiver EM ZERO, significa que o bluetooth que está fazendo a entrada.
-- Por isso o uso dos multiplexadores; essa chave KEY_SET faz o select de quais sinais vai usar no 
-- enable do controlador do motor: se vai ser o start e o cancel do TECLADO ou se vai ser o start e 
-- o cancel do BLUETOOTH!
-- POSSO DESFAZER AS MUDANÇAS CASO VCS JÁ ESTEJAM COM A INTEGRAÇÃO AVANÇADA E ISSO ATRAPALHE MAIS DO QUE
-- AJUDE. 
-- EM TEORIA ISSO DEIXA TUDO MAIS FÁCIL rs

entity Controlador_e is
	port(
			en4	      : in std_logic;
			clk         : in std_logic;
			remote      : in std_logic;   --definido como chave apenas para teste
			local       : in std_logic;	--definido como chave apenas para teste
			sp 			: out std_logic;
			rt				: out std_logic;
			load   		: out std_logic;
			en_count		: out std_logic;
			speed_low   : out std_logic_vector(7 downto 0) := "01100110";
			speed_high  : out std_logic_vector(7 downto 0) := "11111111";
			led_enable  : out std_logic := '0'
		 );
end Controlador_e;

architecture arq1 of Controlador_e is
	TYPE State_type IS (standby, hold, set_speed, power_engine);
	signal state_controller : State_type := standby;

begin
		process(clk,en4)
		begin
			if en4 = '0' then
				state_controller <= standby;
				led_enable <= '0';
			elsif rising_edge(clk) then    -- MUDAR PARA BORDA DE DESCIDA
				
				case state_controller is   
					
					when standby => if en4 = '1' and  remote = '0' and local = '0' then    -- COM O NOVO DIAGRAMA
											sp <= '0';														  -- ESSE PRIMEIRO IF NUNCA VAI SER ALCANÇADO
											rt <= '0';														  -- MANTIVE PRA CASO A GENTE QUEIRA VOLTAR
											load <= '0';													  -- PARA O MODELO ANTERIOR DE FUNCIONAMENTO
											en_count <= '0';
											led_enable <= '1';
											state_controller <= hold;
										 elsif en4 = '1' and  remote = '1' and local = '0' then
											sp <= '1';
											rt <= '1';
											load <= '1';
											en_count <= '0';
											led_enable <= '1';
											state_controller <= set_speed;
										 elsif en4 = '1' and remote = '0' and local = '1' then
											sp <= '0';
											rt <= '0';
											load <= '1';
											en_count <= '0';
											led_enable <= '1';
											state_controller <= set_speed;	
										 end if;
										 
									--																EU TAVA VERIFICANDO AQUI E 
									--																COM ESSE NOVO DIAGRAMA DE BLOCOS
									--																O CONTROLADOR NUNCA VAI ENTRAR 
									--                                              NESSE ESTADO (HOLD), MAS EU JÁ 
									--                                              FIZ AS
									--																AS ALTERAÇÕES PARA ELA CONTINUAR
									--																FUNCIONANDO CERTINHO
					
					when hold => if en4 = '1' and  remote = '1' and local = '0' then
											sp <= '1';
											rt <= '1';
											load <= '1';
											en_count <= '0';
											led_enable <= '1';
											state_controller <= set_speed;
									 elsif en4 = '1' and remote = '0' and local = '1' then
											sp <= '0';
											rt <= '0';
											load <= '1';
											en_count <= '0';
											led_enable <= '1';
											state_controller <= set_speed;
									elsif en4 = '1' and remote = '0' and local = '0' then
											sp <= '0';
											rt <= '0';
											load <= '0';
											en_count <= '0';
											led_enable <= '1';
									 elsif en4 = '0' then 
											sp <= '0';
											rt <= '0';
											load <= '0';
											en_count <= '0';
											led_enable <= '0';
											state_controller <= standby;
									 end if;
					
					when set_speed => en_count <= '1';
											state_controller <= power_engine;
											
											--												A PRINCIPAL ALTERACAO FOI 
											--                                  NO ESTADO ABAIXO!!!
				
					when power_engine => load <='0';                    
												if en4 = '0' then
													sp <= '0';
													rt <= '0';
													load <= '0';
													en_count <= '0';
													led_enable <= '1';
													state_controller <= standby;
												end if;
				 end case;
			end if;
		end process;
end arq1;