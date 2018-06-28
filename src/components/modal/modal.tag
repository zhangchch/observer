<modal>
    <dialog class="dialog">
        <div>input name</div>
        <input ref="input" type="text"></input>
        <div onclick="{ close }">close</div>
        <div onclick="{ add.bind(null, this.addType) }">add</div>
    </dialog>

    <style>
        :scope {
            display: block;
        }
    </style>

    <script>
        this.addType = 'course';

        this.on('before-mount', () => {
            this.mixin('action');
            this.action.on('openModal', (type) => {
                this.openModal(type);
            })
        });

        this.openModal = (type) => {
            if(type == 'addStudent') {
                this.addType = 'student';
            } else {
                this.addType = 'course';
            }
            this.update();
            let dialog = document.querySelector('.dialog');
            dialog.showModal();
        };

        this.close = () => {
            let dialog = document.querySelector('.dialog');
            dialog.close();
        }

        this.add = (type) => {
            let category = this.refs.input.value;
            if(type === 'student') {
                this.action.trigger('addStudent', category);
            } else {
                this.action.trigger('addCourse', category);
            }
            this.close();
        }
    </script>
</modal>