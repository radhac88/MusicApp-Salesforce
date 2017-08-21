public class wrapTrack {
        public Track__C acc {get; set;}
        public Boolean selected {get; set;} 
        public wrapTrack(Track__C a) {
            acc = a;
            selected = false;
        }
}