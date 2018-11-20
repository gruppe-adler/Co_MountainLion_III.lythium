class grad_gas {

    class client {
            file = grad-gas\client;

            class addAction;
            class createFire;
            class createGlow;
            class createLingerEmitter;
            class createWashEmitter;
            class explosionClient;
            class gasEffectsAdd;
            class gasEffectsReset;
            class gasLeak;
    };

    class server {
            file = grad-gas\server;

            class explosionServer;
    };
};