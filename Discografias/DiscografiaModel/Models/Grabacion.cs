//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DiscografiaModel.Models
{
    using System;
    using System.Collections.Generic;
	using System.ComponentModel.DataAnnotations;

	public partial class Grabacion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Grabacion()
        {
            this.Participacions = new HashSet<Participacion>();
        }
    
        public int Id_Grabacion { get; set; }

		[Required(ErrorMessage ="El Titulo es Obligatorio")]
        public string Titulo { get; set; }

		[Required(ErrorMessage = "El Numero de Tema es Obligatorio")]
		public int Num_Tema { get; set; }

		[Required(ErrorMessage = "La Direccion es Obligatorio")]
		public string Descripcion { get; set; }

		[Required(ErrorMessage = "La Compañia es Obligatorio")]
		public int Compañia_id { get; set; }
    
        public virtual Compañia Compañia { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Participacion> Participacions { get; set; }
    }
}
