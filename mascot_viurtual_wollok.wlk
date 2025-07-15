class Mascot{

    const property name 

    const property owner_name 

    const property type 

    var property energy = 100

    const property max_energy = 100

    var property  bored_bar = 0 

    const property tricks = ["voltereta", "dar la pata", "atacar"]

    var property trick = "nada" 

    const property states = ["hambriento", "cansado", "enojado", "feliz", "aburrido"]

    var property actual_state = "feliz"



    method be_happy_mascot(action, frut){ //Llama a todos los metodos para ejecutarlos y poder interactuar con la mascota mas facil

            energy -= 10 // resta 10 de energia al realizar una accion

            self.feed_by_owner(action, frut)

            self.bored_bar_plus(action)

            self.play_with_owner(action)

            self.be_bored()

            self.be_tired()

            self.be_hungry()

            self.do_a_trick()


    }  

    method be_hungry(){  //cambia el estado de la mascota a hambriento si su energia es menor o igual a 30

        if(energy <= 30 ){

            actual_state = "hambriento"

        }

    }

    method do_a_trick(){ //hace un truko si el estado es igual a feliz
 
        if(actual_state == "feliz"){

            trick = tricks.anyOne() // agarra uno al azar de los trucos

        }

    }

    method be_bored() { // cambia el estado de la mascota a aburrido si su barra de aburrimiento es mayor o igual a 9 y menor o igual a 29

        if(bored_bar >= 9 and bored_bar <= 29 ){

            actual_state = "aburrido"

        }
      
    }

    method be_tired() { // cambia el estado de la mascota a cansado si su energia es mayor o igual a 30 y menor o igual a 50
      
        if(energy >= 30 and energy <= 50){

            actual_state = "cansado"

        }

    }


    method be_angry(){ // cambia el estado de la mascota a enojado si su barra de aburrimiento es mayor o igual a 30

        if(bored_bar >= 30){

            actual_state = "enojado"

        }

    }

    method feed_by_owner(action, frut){ // si la accion es alimentar, la mascota come la fruta y se le regenera energia

        if(action == "alimentar"){

            energy += frut.energy_regeneration() // agrega la energia de la fruta a la mascota

            if(energy > max_energy){

                energy = max_energy // si se pasa se iguala a la cantidad maxima de energia

            }

            actual_state = "feliz"
          }

    }

    method bored_bar_plus(action){ //si el dueño no hace nada sube la barra de aburrimiento
      
        if(action == "nada"){bored_bar += 1}
        
    }

    method play_with_owner(action) { //jugar con la mascota
    
        if(action == "jugar"){

            bored_bar = 0

            actual_state = "feliz"

        }
    }

}

//---------------------------------------------------------------------------------------

class Fruts{ //clase frutas

    const property name 

    const property energy_regeneration 

}
//---------------------------------------------------------------------------------------

const apple = new Fruts(name = "Apple", energy_regeneration = 100)

//---------------------------------------------------------------------------------------

const banana = new Fruts(name = "Banana", energy_regeneration = 90)

//---------------------------------------------------------------------------------------

object owner {

    const property owner_name = "tu" 
  
    var property action = "nada"

    const property pets = [cat, lizar] 

    const property fruts_posibles = [apple, banana]

    const property possible_action = ["alimentar", "jugar", "nada"]

    method change_action(pet, action_new, frut){

            if ((action_new != null and possible_action.contains(action_new)) and (frut != null and fruts_posibles.contains(frut)) and (pet != null and pets.contains(pet)) and (pet.energy() >= 10 or pet.bared_bar() <= 99)){
            
            action = action_new //si la accion no es incorrecta o la mascota tiene energuia estonces se guarda la accion

            pet.be_happy_mascot(action_new, frut)// se interactua con la mascota
        
         }

            else{return null} //nos indica que es inavilido el dato

        }

}
//---------------------------------------------------------------------------------------

const cat = new Mascot(name = "Gats", type = "Gato", owner_name = "tu") //gato

//---------------------------------------------------------------------------------------

const lizar = new Mascot(name = "La", type = "Cocodrilo", owner_name ="tu") //lagarto