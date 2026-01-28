1. A quién(es) le debe más dinero y cuánto
SELECT nombre, le_debo FROM finanzas_personales
WHERE le_debo = (SELECT MAX(le_debo) FROM finanzas_personales);


2. Quién(es) le debe más dinero a ud. y cuánto
SELECT nombre, me_debe FROM finanzas_personales
WHERE me_debe = (SELECT MAX(me_debe) FROM finanzas_personales);


3. Cuánto dinero debe en total
SELECT SUM(le_debo) AS total_deuda FROM finanzas_personales;


4. Cuánto dinero debe en promedio.
SELECT AVG(le_debo) AS debo_promedio FROM finanzas_personales;


5. Suponiendo que no puede pagar más de una cuota al mes. ¿Cuántos meses demoraría en saldar su deuda?
SELECT SUM(cuotas_pagar) AS total_meses FROM finanzas_personales;


6. Suponga que logar cobrar todo lo que le deben en un mismo día y decide usar todo eso para pagar lo que se pueda de su deuda.
 ¿A cuánto ascendería su nueva deuda reducida?
 ¿Cuánto tendría que pagar mensualmente para pagar todo lo que resta en las cuotas ya acordadas?

SELECT SUM(le_debo) - SUM(me_debe) AS deuda_reducida FROM finanzas_personales;

SELECT (SUM(le_debo) - SUM(me_debe)) / SUM(cuotas_pagar) AS valor_cuota FROM finanzas_personales;


7. Le debes $50.000 a tu pareja. Insertar un nuevo registro en la tabla.
INSERT INTO finanzas_personales (nombre, me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
VALUES ('Pareja', 0, 0, 50000, 1);


8. Con este cambio empezó a temblar realmente tu situación económica y lo primero que quisiera averiguar es ¿De cuánto será la cuota a pagar este mes?
SELECT SUM(le_debo) / (cuotas_pagar) AS cuota_mensual FROM finanzas_personales;
WHERE cuotas_pagar > 0;


9. La señora del almacén de la esquina te tiene buena y te permitió bondadosamente pagarle en 13 cuotas
UPDATE finanzas_personales SET cuotas_pagar = 13
WHERE nombre = 'almacén esquina';

SELECT * FROM finanzas_personales


10.Ahora que realizaste este pequeño (pero importante) ajuste ¿De cuánto será la cuota a pagar este mes?
SELECT SUM(le_debo) / (cuotas_pagar) AS cuota_total_mes FROM finanzas_personales;
WHERE cuotas_pagar > 0;